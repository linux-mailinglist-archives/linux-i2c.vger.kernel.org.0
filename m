Return-Path: <linux-i2c+bounces-7671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3A9B72BC
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 04:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875FE28635D
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 03:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A72130ADA;
	Thu, 31 Oct 2024 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDFpnY9l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768CC34CDE;
	Thu, 31 Oct 2024 03:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730344311; cv=none; b=kdKVsvYaN53+MCbTb7oxQAN7K0VzD2MZRPcusdA9NoXd2/iR2L5Ik8yaRNcolyCH0lrOFc/rbuLf19marJVWFN4BpAHmLAcmovGTIvXwh4+SS7ZQPXk9EfZGsOCcGeJoGFpaQCUORi//5/kFDO1Sgw53faohCH5HT87QXDy5Z3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730344311; c=relaxed/simple;
	bh=HdR1SdELFEUYnCWa+nbdeZVogDmDr0xybRKwrbkH7aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQNb7fqmhiXcIE1f4snuULXgu7VhFncD6ikBfuAg/2sydTWErHjuQOUwE/u6Qu8LvhOX1LLsKgTX8/BDlL9hmw7qgh0byPcmFMlaV+8OBN8ZR6CdukXlKljf33ggAfuxlh0AbsgF/7Mz1Ji+jhwcpLtFzV3qN59FErbNrRLvAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDFpnY9l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730344309; x=1761880309;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HdR1SdELFEUYnCWa+nbdeZVogDmDr0xybRKwrbkH7aU=;
  b=GDFpnY9logo8HaYMQ4zP3p1YcFMofOrV0D9O6yfEe/jYKIQbG4df6QCY
   KU6kq9t805FrtQFqqQ2ExLsh9xWr6oqczjrRiJGTogeeVxG8pEfuqpOHw
   jxsRgXtV4lajfa7P76MbnLS5q0aZJr35AqziOLu5w5XArVsbhUk+wu4m7
   cEoI0J02bM9S0/EvN4IjekVCwsUZsEJlzwkGYWV07F0pi8rRSh4QdFTWK
   ErbZrvYLdamzRue4CsBIOw6SirU7WR8k0ArzIsBS1/Zyxo/WZoX2/lPWN
   lj1aPxsF8L+jsm3ROUS5iD/B8j8egbi/WuqYNeIWGiRU4EmNsJJufww5D
   A==;
X-CSE-ConnectionGUID: i8mTFIvkQUC2PBTA+PTuDQ==
X-CSE-MsgGUID: JhbTqFzmReuqEZw2LhKanA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41438970"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="41438970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 20:11:46 -0700
X-CSE-ConnectionGUID: fRc3ztTNTz6LwTDLmkOHmA==
X-CSE-MsgGUID: E557BKf9Tka+vq7/ghKHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="113302027"
Received: from qz-dev1.sh.intel.com (HELO localhost) ([10.239.147.28])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 20:11:38 -0700
From: qiang4.zhang@linux.intel.com
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Chen, Jian Jun" <jian.jun.chen@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Qiang Zhang <qiang4.zhang@intel.com>,
	virtualization@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] virtio: only reset device and restore status if needed in device resume
Date: Thu, 31 Oct 2024 11:08:44 +0800
Message-ID: <20241031030847.3253873-1-qiang4.zhang@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qiang Zhang <qiang4.zhang@intel.com>

Virtio core unconditionally reset and restore status for all virtio
devices before calling restore method. This breaks some virtio drivers
which don't need to do anything in suspend and resume because they
just want to keep device state retained.

Virtio GPIO is a typical example. GPIO states should be kept unchanged
after suspend and resume (e.g. output pins keep driving the output) and
Virtio GPIO driver does nothing in freeze and restore methods. But the
reset operation in virtio_device_restore breaks this.

Since some devices need reset in suspend and resume while some needn't,
create a new helper function for the original reset and status restore
logic so that virtio drivers can invoke it in their restore method
if necessary.

Signed-off-by: Qiang Zhang <qiang4.zhang@intel.com>
---
 drivers/block/virtio_blk.c                 |  4 +++
 drivers/char/hw_random/virtio-rng.c        |  4 +++
 drivers/char/virtio_console.c              |  4 +++
 drivers/crypto/virtio/virtio_crypto_core.c |  4 +++
 drivers/i2c/busses/i2c-virtio.c            |  6 ++++
 drivers/net/virtio_net.c                   |  4 +++
 drivers/scsi/virtio_scsi.c                 |  4 +++
 drivers/virtio/virtio.c                    | 35 ++++++++++++++--------
 drivers/virtio/virtio_balloon.c            |  4 +++
 drivers/virtio/virtio_input.c              |  4 +++
 drivers/virtio/virtio_mem.c                |  4 +++
 include/linux/virtio.h                     |  1 +
 sound/virtio/virtio_card.c                 |  4 +++
 13 files changed, 70 insertions(+), 12 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 194417abc105..bba7148bd219 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1612,6 +1612,10 @@ static int virtblk_restore(struct virtio_device *vdev)
 	struct virtio_blk *vblk = vdev->priv;
 	int ret;
 
+	ret = virtio_device_reset_and_restore_status(vdev);
+	if (ret)
+		return ret;
+
 	ret = init_vq(vdev->priv);
 	if (ret)
 		return ret;
diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
index dd998f4fe4f2..954280514f5a 100644
--- a/drivers/char/hw_random/virtio-rng.c
+++ b/drivers/char/hw_random/virtio-rng.c
@@ -218,6 +218,10 @@ static int virtrng_restore(struct virtio_device *vdev)
 {
 	int err;
 
+	err = virtio_device_reset_and_restore_status(vdev);
+	if (err)
+		return err;
+
 	err = probe_common(vdev);
 	if (!err) {
 		struct virtrng_info *vi = vdev->priv;
diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index c62b208b42f1..c431e4d5cd29 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -2132,6 +2132,10 @@ static int virtcons_restore(struct virtio_device *vdev)
 
 	portdev = vdev->priv;
 
+	ret = virtio_device_reset_and_restore_status(vdev);
+	if (ret)
+		return ret;
+
 	ret = init_vqs(portdev);
 	if (ret)
 		return ret;
diff --git a/drivers/crypto/virtio/virtio_crypto_core.c b/drivers/crypto/virtio/virtio_crypto_core.c
index d0278eb568b9..b3363dd80448 100644
--- a/drivers/crypto/virtio/virtio_crypto_core.c
+++ b/drivers/crypto/virtio/virtio_crypto_core.c
@@ -536,6 +536,10 @@ static int virtcrypto_restore(struct virtio_device *vdev)
 	struct virtio_crypto *vcrypto = vdev->priv;
 	int err;
 
+	err = virtio_device_reset_and_restore_status(vdev);
+	if (err)
+		return err;
+
 	err = virtcrypto_init_vqs(vcrypto);
 	if (err)
 		return err;
diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 2a351f961b89..ce6493d6fe8e 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -251,6 +251,12 @@ static int virtio_i2c_freeze(struct virtio_device *vdev)
 
 static int virtio_i2c_restore(struct virtio_device *vdev)
 {
+	int ret;
+
+	ret = virtio_device_reset_and_restore_status(vdev);
+	if (ret)
+		return ret;
+
 	return virtio_i2c_setup_vqs(vdev->priv);
 }
 
diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 792e9eadbfc3..5be2a5f68f68 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -6693,6 +6693,10 @@ static __maybe_unused int virtnet_restore(struct virtio_device *vdev)
 	struct virtnet_info *vi = vdev->priv;
 	int err;
 
+	err = virtio_device_reset_and_restore_status(vdev);
+	if (err)
+		return err;
+
 	err = virtnet_restore_up(vdev);
 	if (err)
 		return err;
diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 8471f38b730e..3aeddf6331d3 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -1016,6 +1016,10 @@ static int virtscsi_restore(struct virtio_device *vdev)
 	struct virtio_scsi *vscsi = shost_priv(sh);
 	int err;
 
+	err = virtio_device_reset_and_restore_status(vdev);
+	if (err)
+		return err;
+
 	err = virtscsi_init(vdev, vscsi);
 	if (err)
 		return err;
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index b9095751e43b..0446b30c83d6 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -549,7 +549,7 @@ int virtio_device_freeze(struct virtio_device *dev)
 }
 EXPORT_SYMBOL_GPL(virtio_device_freeze);
 
-int virtio_device_restore(struct virtio_device *dev)
+int virtio_device_reset_and_restore_status(struct virtio_device *dev)
 {
 	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
 	int ret;
@@ -574,23 +574,34 @@ int virtio_device_restore(struct virtio_device *dev)
 
 	ret = dev->config->finalize_features(dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = virtio_features_ok(dev);
 	if (ret)
-		goto err;
+		return ret;
 
-	if (drv->restore) {
-		ret = drv->restore(dev);
-		if (ret)
-			goto err;
-	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(virtio_device_reset_and_restore_status);
 
-	/* If restore didn't do it, mark device DRIVER_OK ourselves. */
-	if (!(dev->config->get_status(dev) & VIRTIO_CONFIG_S_DRIVER_OK))
-		virtio_device_ready(dev);
+int virtio_device_restore(struct virtio_device *dev)
+{
+	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
+	int ret;
 
-	virtio_config_core_enable(dev);
+	if (drv) {
+		if (drv->restore) {
+			ret = drv->restore(dev);
+			if (ret)
+				goto err;
+		}
+
+		/* If restore didn't do it, mark device DRIVER_OK ourselves. */
+		if (!(dev->config->get_status(dev) & VIRTIO_CONFIG_S_DRIVER_OK))
+			virtio_device_ready(dev);
+
+		virtio_config_core_enable(dev);
+	}
 
 	return 0;
 
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index b36d2803674e..ba92b3e56391 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -1163,6 +1163,10 @@ static int virtballoon_restore(struct virtio_device *vdev)
 	struct virtio_balloon *vb = vdev->priv;
 	int ret;
 
+	ret = virtio_device_reset_and_restore_status(vdev);
+	if (ret)
+		return ret;
+
 	ret = init_vqs(vdev->priv);
 	if (ret)
 		return ret;
diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index a5d63269f20b..81c2ffd0e76e 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -374,6 +374,10 @@ static int virtinput_restore(struct virtio_device *vdev)
 	struct virtio_input *vi = vdev->priv;
 	int err;
 
+	err = virtio_device_reset_and_restore_status(vdev);
+	if (err)
+		return err;
+
 	err = virtinput_init_vqs(vi);
 	if (err)
 		return err;
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index b0b871441578..47c23aa43c20 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -3018,6 +3018,10 @@ static int virtio_mem_restore(struct virtio_device *vdev)
 	struct virtio_mem *vm = vdev->priv;
 	int ret;
 
+	ret = virtio_device_reset_and_restore_status(vdev);
+	if (ret)
+		return ret;
+
 	ret = virtio_mem_init_vq(vm);
 	if (ret)
 		return ret;
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 306137a15d07..ab850146f0a8 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -175,6 +175,7 @@ void virtio_config_driver_enable(struct virtio_device *dev);
 
 #ifdef CONFIG_PM_SLEEP
 int virtio_device_freeze(struct virtio_device *dev);
+int virtio_device_reset_and_restore_status(struct virtio_device *dev);
 int virtio_device_restore(struct virtio_device *dev);
 #endif
 void virtio_reset_device(struct virtio_device *dev);
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 965209e1d872..3c7a6d76c46c 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -412,6 +412,10 @@ static int virtsnd_restore(struct virtio_device *vdev)
 	struct virtio_snd *snd = vdev->priv;
 	int rc;
 
+	rc = virtio_device_reset_and_restore_status(vdev);
+	if (rc)
+		return rc;
+
 	rc = virtsnd_find_vqs(snd);
 	if (rc)
 		return rc;
-- 
2.45.2


