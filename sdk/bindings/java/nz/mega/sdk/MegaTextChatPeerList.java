/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.8
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package nz.mega.sdk;

public class MegaTextChatPeerList {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected MegaTextChatPeerList(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(MegaTextChatPeerList obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  protected synchronized void delete() {   
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        megaJNI.delete_MegaTextChatPeerList(swigCPtr);
      }
      swigCPtr = 0;
    }
}

  public static MegaTextChatPeerList createInstance() {
    long cPtr = megaJNI.MegaTextChatPeerList_createInstance();
    return (cPtr == 0) ? null : new MegaTextChatPeerList(cPtr, false);
  }

   MegaTextChatPeerList copy() {
    long cPtr = megaJNI.MegaTextChatPeerList_copy(swigCPtr, this);
    return (cPtr == 0) ? null : new MegaTextChatPeerList(cPtr, false);
  }

  public void addPeer(long h, int priv) {
    megaJNI.MegaTextChatPeerList_addPeer(swigCPtr, this, h, priv);
  }

  public long getPeerHandle(int i) {
    return megaJNI.MegaTextChatPeerList_getPeerHandle(swigCPtr, this, i);
  }

  public int getPeerPrivilege(int i) {
    return megaJNI.MegaTextChatPeerList_getPeerPrivilege(swigCPtr, this, i);
  }

  public int size() {
    return megaJNI.MegaTextChatPeerList_size(swigCPtr, this);
  }

  public final static int PRIV_UNKNOWN = -2;
  public final static int PRIV_RM = -1;
  public final static int PRIV_RO = 0;
  public final static int PRIV_STANDARD = 2;
  public final static int PRIV_MODERATOR = 3;

}
