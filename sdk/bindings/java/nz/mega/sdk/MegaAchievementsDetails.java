/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.8
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package nz.mega.sdk;

public class MegaAchievementsDetails {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected MegaAchievementsDetails(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(MegaAchievementsDetails obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  protected synchronized void delete() {   
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        megaJNI.delete_MegaAchievementsDetails(swigCPtr);
      }
      swigCPtr = 0;
    }
}

  public long getBaseStorage() {
    return megaJNI.MegaAchievementsDetails_getBaseStorage(swigCPtr, this);
  }

  public long getClassStorage(int class_id) {
    return megaJNI.MegaAchievementsDetails_getClassStorage(swigCPtr, this, class_id);
  }

  public long getClassTransfer(int class_id) {
    return megaJNI.MegaAchievementsDetails_getClassTransfer(swigCPtr, this, class_id);
  }

  public int getClassExpire(int class_id) {
    return megaJNI.MegaAchievementsDetails_getClassExpire(swigCPtr, this, class_id);
  }

  public long getAwardsCount() {
    return megaJNI.MegaAchievementsDetails_getAwardsCount(swigCPtr, this);
  }

  public int getAwardClass(long index) {
    return megaJNI.MegaAchievementsDetails_getAwardClass(swigCPtr, this, index);
  }

  public int getAwardId(long index) {
    return megaJNI.MegaAchievementsDetails_getAwardId(swigCPtr, this, index);
  }

  public long getAwardTimestamp(long index) {
    return megaJNI.MegaAchievementsDetails_getAwardTimestamp(swigCPtr, this, index);
  }

  public long getAwardExpirationTs(long index) {
    return megaJNI.MegaAchievementsDetails_getAwardExpirationTs(swigCPtr, this, index);
  }

  public MegaStringList getAwardEmails(long index) {
    long cPtr = megaJNI.MegaAchievementsDetails_getAwardEmails(swigCPtr, this, index);
    return (cPtr == 0) ? null : new MegaStringList(cPtr, true);
  }

  public int getRewardsCount() {
    return megaJNI.MegaAchievementsDetails_getRewardsCount(swigCPtr, this);
  }

  public int getRewardAwardId(long index) {
    return megaJNI.MegaAchievementsDetails_getRewardAwardId(swigCPtr, this, index);
  }

  public long getRewardStorage(long index) {
    return megaJNI.MegaAchievementsDetails_getRewardStorage(swigCPtr, this, index);
  }

  public long getRewardTransfer(long index) {
    return megaJNI.MegaAchievementsDetails_getRewardTransfer(swigCPtr, this, index);
  }

  public long getRewardStorageByAwardId(int award_id) {
    return megaJNI.MegaAchievementsDetails_getRewardStorageByAwardId(swigCPtr, this, award_id);
  }

  public long getRewardTransferByAwardId(int award_id) {
    return megaJNI.MegaAchievementsDetails_getRewardTransferByAwardId(swigCPtr, this, award_id);
  }

  public int getRewardExpire(long index) {
    return megaJNI.MegaAchievementsDetails_getRewardExpire(swigCPtr, this, index);
  }

   MegaAchievementsDetails copy() {
    long cPtr = megaJNI.MegaAchievementsDetails_copy(swigCPtr, this);
    return (cPtr == 0) ? null : new MegaAchievementsDetails(cPtr, true);
  }

  public long currentStorage() {
    return megaJNI.MegaAchievementsDetails_currentStorage(swigCPtr, this);
  }

  public long currentTransfer() {
    return megaJNI.MegaAchievementsDetails_currentTransfer(swigCPtr, this);
  }

  public long currentStorageReferrals() {
    return megaJNI.MegaAchievementsDetails_currentStorageReferrals(swigCPtr, this);
  }

  public long currentTransferReferrals() {
    return megaJNI.MegaAchievementsDetails_currentTransferReferrals(swigCPtr, this);
  }

  public MegaAchievementsDetails() {
    this(megaJNI.new_MegaAchievementsDetails(), true);
  }

  public final static int MEGA_ACHIEVEMENT_WELCOME = 1;
  public final static int MEGA_ACHIEVEMENT_INVITE = 3;
  public final static int MEGA_ACHIEVEMENT_DESKTOP_INSTALL = 4;
  public final static int MEGA_ACHIEVEMENT_MOBILE_INSTALL = 5;

}
