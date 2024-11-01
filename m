Return-Path: <linux-i2c+bounces-7702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60759B88F0
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 02:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64093282B7B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 01:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AFC136347;
	Fri,  1 Nov 2024 01:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaYJP/k/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22BC81ACA;
	Fri,  1 Nov 2024 01:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730426047; cv=none; b=IuE8rHk14cpiM49SLBHAFTFRqxqjIa6b9eSMpGwbHe0GZDmpa5lQpKUYyqzW9GGBjmE8lEuUpXK6YBqcYjcQSShnXlDgYW0GoVayA8Y4rGQ8R+PmEPMX+HE9TY0hpl40weOoqdydo0X9zBK3cOJCWjA0TUiVEWn3gaP2NDd/+1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730426047; c=relaxed/simple;
	bh=3HRKGQNIiCPfH8z+twS7cEGWy+9O3/ZETqBtK388FqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIPOT5p2Z2YgU4QfHdb0Ud+NdGbmExWOpXhOQj6celTV1VzULFGrLV0S7iuhn2e/Lj+iJbghzlCS1SS3Sb2+UDAKRLKd0R/Sfdmc4hYKwOOpNb54hGsfpgyiWPdi9u+4OLejsxHVPL8CBayU59l8hXPifOQjnp/CciSzmxOwMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaYJP/k/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730426041; x=1761962041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3HRKGQNIiCPfH8z+twS7cEGWy+9O3/ZETqBtK388FqY=;
  b=CaYJP/k/O9GtrrveYPp2+1Tgz5S6RVPLzwncYbvmUrLN3tUKSxLKWJYP
   7y5kokmFn8Z6/PfDulizsjZOZijDJ2DAd5v5rWdWNGA2yljJCZmPypu7B
   NDdIMzahu1J0E1NyenN+eu4OOS1ebIk3yjUM/XhPXzxVTM2QLd34kXded
   z/v4v9xcaCIYbH8aW70P4QEyZJeu9iBqqG/9CtlUgMJ2lqghMv/966qzh
   quaZLvRX3KoQVxnzhVh4YK0SkDfD6cOudJbwfr6/PZ9otoO7ussSj6DAC
   515n5DUwlujLGPA0sUDXj38k+5iCjtXvcNJgKozESFwDT+zvJ7QsIksev
   A==;
X-CSE-ConnectionGUID: bjnDxhpNSrCQ3l6km2HVKA==
X-CSE-MsgGUID: NNc6GJcbQHm/rmFcGt907w==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41559322"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="41559322"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:53:59 -0700
X-CSE-ConnectionGUID: 3rFKcVZHRfKkqRp5id5Qlw==
X-CSE-MsgGUID: FTKPoQIpTc+gi+1I4sWetA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="106145077"
Received: from qz-dev1.sh.intel.com (HELO localhost) ([10.239.147.28])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:53:40 -0700
From: qiang4.zhang@linux.intel.com
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
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
Subject: [PATCH v2] virtio: only reset device and restore status if needed in device resume
Date: Fri,  1 Nov 2024 09:50:58 +0800
Message-ID: <20241101015101.98111-1-qiang4.zhang@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031030847.3253873-1-qiang4.zhang@linux.intel.com>
References: <20241031030847.3253873-1-qiang4.zhang@linux.intel.com>
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
v1 -> v2:
 - Fix compilation error when CONFIG_PM_SLEEP is disabled. Move
   virtio_device_reset_and_restore_status out of CONFIG_PM_SLEEP scope.

 drivers/block/virtio_blk.c                 |  4 ++
 drivers/char/hw_random/virtio-rng.c        |  4 ++
 drivers/char/virtio_console.c              |  4 ++
 drivers/crypto/virtio/virtio_crypto_core.c |  4 ++
 drivers/i2c/busses/i2c-virtio.c            |  6 ++
 drivers/net/virtio_net.c                   |  4 ++
 drivers/scsi/virtio_scsi.c                 |  4 ++
 drivers/virtio/virtio.c                    | 83 ++++++++++++----------
 drivers/virtio/virtio_balloon.c            |  4 ++
 drivers/virtio/virtio_input.c              |  4 ++
 drivers/virtio/virtio_mem.c                |  4 ++
 include/linux/virtio.h                     |  1 +
 sound/virtio/virtio_card.c                 |  4 ++
 13 files changed, 94 insertions(+), 36 deletions(-)

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
index b9095751e43b..55f80a61fb85 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -527,6 +527,41 @@ void unregister_virtio_device(struct virtio_device *dev)
 }
 EXPORT_SYMBOL_GPL(unregister_virtio_device);
 
+int virtio_device_reset_and_restore_status(struct virtio_device *dev)
+{
+	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
+	int ret;
+
+	/* We always start by resetting the device, in case a previous
+	 * driver messed it up. */
+	virtio_reset_device(dev);
+
+	/* Acknowledge that we've seen the device. */
+	virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
+
+	/* Maybe driver failed before freeze.
+	 * Restore the failed status, for debugging. */
+	if (dev->failed)
+		virtio_add_status(dev, VIRTIO_CONFIG_S_FAILED);
+
+	if (!drv)
+		return 0;
+
+	/* We have a driver! */
+	virtio_add_status(dev, VIRTIO_CONFIG_S_DRIVER);
+
+	ret = dev->config->finalize_features(dev);
+	if (ret)
+		return ret;
+
+	ret = virtio_features_ok(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(virtio_device_reset_and_restore_status);
+
 #ifdef CONFIG_PM_SLEEP
 int virtio_device_freeze(struct virtio_device *dev)
 {
@@ -554,44 +589,20 @@ int virtio_device_restore(struct virtio_device *dev)
 	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
 	int ret;
 
-	/* We always start by resetting the device, in case a previous
-	 * driver messed it up. */
-	virtio_reset_device(dev);
-
-	/* Acknowledge that we've seen the device. */
-	virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
-
-	/* Maybe driver failed before freeze.
-	 * Restore the failed status, for debugging. */
-	if (dev->failed)
-		virtio_add_status(dev, VIRTIO_CONFIG_S_FAILED);
-
-	if (!drv)
-		return 0;
-
-	/* We have a driver! */
-	virtio_add_status(dev, VIRTIO_CONFIG_S_DRIVER);
-
-	ret = dev->config->finalize_features(dev);
-	if (ret)
-		goto err;
-
-	ret = virtio_features_ok(dev);
-	if (ret)
-		goto err;
-
-	if (drv->restore) {
-		ret = drv->restore(dev);
-		if (ret)
-			goto err;
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
 	}
 
-	/* If restore didn't do it, mark device DRIVER_OK ourselves. */
-	if (!(dev->config->get_status(dev) & VIRTIO_CONFIG_S_DRIVER_OK))
-		virtio_device_ready(dev);
-
-	virtio_config_core_enable(dev);
-
 	return 0;
 
 err:
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
index 306137a15d07..bce26597b8fc 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -178,6 +178,7 @@ int virtio_device_freeze(struct virtio_device *dev);
 int virtio_device_restore(struct virtio_device *dev);
 #endif
 void virtio_reset_device(struct virtio_device *dev);
+int virtio_device_reset_and_restore_status(struct virtio_device *dev);
 
 size_t virtio_max_dma_size(const struct virtio_device *vdev);
 
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


