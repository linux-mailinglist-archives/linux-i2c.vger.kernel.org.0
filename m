Return-Path: <linux-i2c+bounces-5271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878B94D3B2
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 17:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD58F1C21D08
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FC2199EA1;
	Fri,  9 Aug 2024 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eyhlheKI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DC71993B8;
	Fri,  9 Aug 2024 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723217758; cv=none; b=NtFYfzqsSfgCwcj6+d7t3qdGhtY+c+7etIuP72A7I1iApW+kV+IE98dwsN8rfCoNeKLtZORZpYRShSgb02N7YCi975Sv+jejyjyvV8ImhTwKWZ/ORuINEqnS8NWPVzq5M4izDAFL/m7XwPfoJ3TiLq+q8gheBuH5Bg/++O/RflI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723217758; c=relaxed/simple;
	bh=dNQcWdd/iWzRjVBCAWZe/Q7hHpy7CLXUD0gtLgIAXgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6pc7wI29pXiXKUgfZAjKh0I+uN72tMF6zXiexQva+NJaHtRUKQnSKtQCHsmLKPqcXTL9UgEPill1+x1gj/Md4SBrmbdfrtvVDTqlIhs8U1nIAXwUD28iV+RbXgnmNDryQSrm8oxzM/UN086CAAFSZcGuf8NjFjULZglIQ2TXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eyhlheKI; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 572D9C0004;
	Fri,  9 Aug 2024 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723217754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wLpKWsQiF7y/LUYEs8/Wz7zA91+yoPEauv87bwPtjw=;
	b=eyhlheKIoL4c/nXLZKH975JXaGstp08K+gwzBLwtVhPf1GfUp3B5cKb3Cjz+aO9RdBXJYA
	hv9LIGidU6ddiMdOTEEsDuSxB0xcWMhGJM5f9yA++tAeVnZNgbXX+NSHd+EI54XC+uxiY9
	8zOw4p4iulf0ZZ+1Evw2hPhHy7DKqKSnECscWGkCw+m0bL/q1/lac7/qtxm4mAa1ky6du4
	VMzTbnU5IGQ16UJyl8lg76TGb+c5pp16ydcOtrlV8geGarkDYE1o/TjHG3GTMFXwDhYm8+
	AAh32vtzsVcnTVf4mYOawpFoc2675FeaIKBalPWfnmq1fA2+Z1qVKdfWhAazAQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Aug 2024 17:34:55 +0200
Subject: [PATCH DO NOT APPLY v3 7/7] driver core: do not unblock consumers
 any drivers found
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-hotplug-drm-bridge-v3-7-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: luca.ceresoli@bootlin.com

Quick summary:

I have investigated a problem for a long time, I have a pretty good
understanding, I tried various fixes but none except this is working. The
goal of this patch is to discuss the problem to converge to the best
solution.

---------------------------------
Symptoms
---------------------------------

The problem appeared while testing the v3 addon connector driver that is
part of this seres, and which is based on device tree overlays.

Note the symptom happens often, but not always. Changes to logging is a
typical way to make it appear/disappear, so it appears as time sensitive.

The relevant DT overlay snippet is:

/ {
    fragment@0 {
        target-path = "";

        __overlay__ {
            nobus-devices {
	        // nodes in here are populated as platform devices
                reg_addon_3v3_lcd: regulator-addon-3v3-lcd {
                    compatible = "regulator-fixed";
                    regulator-name = "3V3_LCD_ADDON";
                    gpios = <...>;
                };

                addon_panel_dsi_lvds: panel-dsi-lvds {
                    compatible = "...";
                    power-supply = <&reg_addon_3v3_lcd>;
                };
            };
        };
    };
};

So the regulator is a supplier to the panel. Nothing special here, except
we are in an overlay.

The overlay gets applied and all devices work correctly. Troubles start
appearing in the form of two messages on overlay removal, in this order:

 * WARNING: CPU: 1 PID: 189 at drivers/regulator/core.c:5856 regulator_unregister+0x1ec/0x208

   This is issued during removal of the 3V3_LCD_ADDON regulator because
   rdev->open_count is 1, while it should be 0. This is because the panel
   still hasn't closed the regulator.

 * Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
   Call trace:
    regulator_lock_recursive+0x5c/0x200
    regulator_lock_dependent+0xc0/0x140
    regulator_enable+0x44/0x98
    panel_simple_resume+0x38/0x108 [panel_simple]
    pm_generic_runtime_resume+0x34/0x58
    __rpm_callback+0x50/0x1f0
    rpm_callback+0x70/0x88
    rpm_resume+0x49c/0x678
    __pm_runtime_resume+0x54/0xa0
    device_release_driver_internal+0xd4/0x240
    device_release_driver+0x20/0x38
    bus_remove_device+0xd4/0x120
    device_del+0x154/0x388

   This happens while the panel driver is being removed and the devm infra
   tries to close the regulator which is already gone.

Both errors have the same origin: the regulator driver is removed before
the panel driver.

---------------------------------
Problem analysis
---------------------------------

My analysis showed that the problem originates from devlink manipulation
during overlay insertion, but shows its effects on removal. This is the
sequence of events:

 * During overlay insertion:
   1. the devlink code creates a devlink (A) with:
        supplier = regulator-addon-3v3-lcd
        consumer = panel-dsi-lvds
        flags    = DL_FLAG_INFERRED (+ possibly others) because it has
	           been inferred from firmware data
   2. soon after, devlink A is relaxed and then dropped
      - does not happen always, based on timing
      - see below for details
   3. the regulator-addon-3v3-lcd regulator gets probed as a platform device
      - the probe function for regulator-addon-3v3-lcd is
        reg_fixed_voltage_probe(), which calls devm_regulator_register() to
        register a single new regulator class device for the voltage output
        -  regulator_register() does, among others:
          - instantiate a new regulator class device (3V3_LCD_ADDON), with
            parent = regulator-addon-3v3-lcd
          - adds a devlink (B)  with:
              supplier = 3V3_LCD_ADDON
              consumer = panel-dsi-lvds

At this point we have these devices and devlinks:

 .---------------------------.
 |  regulator-addon-3v3-lcd  |
 | regulator platform device | supplier                consumer
 |      (struct device)      |<--------- devlink A -------------.
 '---------------------------'          (inferred)              |
     ^                                                          V
     |                                                  .-----------------.
     | parent                                           | panel-dsi-lvds  |
     |                                                  | (struct device) |
     |                                                  '-----------------'
 .---------------------------.                                  ^
 |       3V3_LCD_ADDON       | supplier                consumer |
 |   regulator class device  |<--------- devlink B -------------'
 |      (struct device)      |          (created by
 '---------------------------'        regulator core)

Depending on whether step 2 happens or not, devlink A will be still present
or not during overlay removal.

When step 2 happens and devlink A gets dropped (which happens to me almost
always), the removal code calls:

-> device_release_driver(dev = regulator-addon-3v3-lcd)
   -> device_release_driver_internal()
      -> __device_release_driver()
         -> if (device_links_busy()) // see below
	     {
	        device_links_unbind_consumers(dev = regulator-addon-3v3-lcd)
		 -> for each consumer for which 'dev' is a supplier:
		    {
		       device_release_driver_internal(dev = panel-dsi-lvds)
                    }
             }

The logic is pretty clear: before removing a device that is a supplier to
other devices (regulator-addon-3v3-lcd), use devlink to find all consumers
(panel-dsi-lvds) and remove them first, recursively.

However in case devlink A had been initially dropped, there is no devlink
between the two devices. The regulator removal will just proceed, and the
regulator device gets removed before its consumer.

Note devlink B is not at all within this removal phase. device_links_busy()
looks at the platform device (regulator-addon-3v3-lcd), and it has no way
to know about the class device (3V3_LCD_ADDON).

Assuming the whole device_links_busy() / device_links_unbind_consumers()
logic is correct, let's move to why devlink A gets dropped.

---------------------------------
Why the devlink is dropped
---------------------------------

It all starts in the device_add() for regulator-addon-3v3-lcd:

  /*
   * If all driver registration is done and a newly added device doesn't
   * match with any driver, don't block its consumers from probing in
   * case the consumer device is able to operate without this supplier.
   */
   if (dev->fwnode && fw_devlink_drv_reg_done && !dev->can_match)
       fw_devlink_unblock_consumers(dev);

The three conditions in the if() mean:

 1. this device comes from firmware -> always true in my case (device tree)
 2. this global flag is set via the deferred_probe_timeout_work as soon as
    for 10 consecutive seconds there is no new driver being probed; it is
    never cleared
 3. no driver has been matched with this device so far (IOW the probe
    function of the driver for this device has never been called,
    regardless of the return value)

If all condtions apply, fw_devlink_unblock_consumers() will (after some
checks) call fw_devlink_relax_link() on every link to consumers and "relax"
it. Relaxing means setting link flags to DL_FLAG_MANAGED |
FW_DEVLINK_FLAGS_PERMISSIVE. Soon later, device_links_driver_bound() will
take devlinks with these flags and drop them.

I was unable to understand in full detail the flag manipulation logic
happening in the devlink code. However I think the high-level logic here
can be expressed as: if a devlink was inferred from firmware and its
supplier device did not probe after a while (*) because no potential driver
was found, then maybe that devlink was wrong or it is enforcing a supplier
that is optional for the consumer: let's drop the link and see whether the
(formerly devlink consumer) device can now probe.

(*) "after a while" is implemented by the fw_devlink_drv_reg_done flag,
     which typically gets set way less than a minute after boot

    Basically fw_devlink_drv_reg_done flag splits the probing in two
    phases. In phase 1 we try to probe all inferred suppliers before
    probing consumers. Then we set fw_devlink_drv_reg_done and relax+drop
    the "dangling" inferred devlinks. Then in phase 2 we try to probe
    without inferred devlinks. This is to see if we can probe more devices
    due to incorrectly inferred devlinks or missing drivers for optional
    suppliers.

Overlays however can be loaded at any time, even a long time after
booting. This is totally normal when used for a hotplug connector, where
the devices get physically connected by the user. This implies the
fw_devlink_drv_reg_done flag is found already set when probing overlay
devices. And so, conditions 1 and 2 above are always set in the overlay
case.

So we are left with condition 3 only. Again I haven't done a full analysis
here, but it is perfectly fine that a driver is not immediately present
when adding a new device. It can just have not yet been matched, possibly
because a driver module is in process of being loaded from storage.

I think there is a race here: on one side the driver becoming available and
matched and the device to probe, on the other side the
fw_devlink_unblock_consumers() logic to relax and drop inferred
devlinks. If the device probes first, the link won't be dropped.

---------------------------------
Same problem without DT overlays?
---------------------------------

Based on the above, I suspect the exact same problem exists even without
any overlay usage. Indeed, the conditions might exist in other corner
cases. One example is a device whose driver is a module and is not loaded
during boot: e.g. it is not on the root filesystem, it is being developed
and the programmer sends the driver via SSH to a tmpfs to load and test it.

As said, this is a matter of corner cases, but still possible.

Note that no problem should happen to natively removable devices such as
USB, because condition 1 defuses the whole if() above for devices not
described in firmware.

---------------------------------
Fixes I have tried (not working)
---------------------------------

I tried a couple approaches based on devlink to fix this issue.

One was augmenting the regulator core code to add a new devlink between the
regulator platform device (regulator-addon-3v3-lcd) and the regulator class
device (3V3_LCD_ADDON), to create a chain for device_links_busy() to
follow. The devlink is created and persists until removal time. However it
does not enforce the correct ordering: device_links_busy() ignores it
because the link status is always "dormant". The reason appears to be that
the "regulator output device" is a struct device but never has a
driver. Recently Saravana pointed out that:

> device links don't work correctly for "class" type devices
(https://lore.kernel.org/all/CAGETcx-ioF=jTbyQMeD2fsYKz8q5vw_TWYWS9m8H5=pCo5KFYA@mail.gmail.com/)

which is possibly related.

I tried a variant: change the devlink already created by _regulator_get()
to use the regulator platform device (regulator-addon-3v3-lcd) instead of
the regulator class device (3V3_LCD_ADDON) as the supplier. That would make
devlink B have the same endpoints as devlink A. However this did not work
due to the link state staying "not tracked" and thus again being ignored by
device_links_busy(). I haven't managed to find out the flag manipulations
that would make it work.

---------------------------------
Conclusions
---------------------------------

The current logic is clearly OK for "typical" current use cases (not
counting corner cases), but unsuitable for hotplugged devices described by
firmware.

The question is: do we have an underlying assumption that was valid so far
but is wrong when overlays are added?

One possible answer is: dropping inferred devlinks is wrong. Generally
speaking, inferred devlinks are sometimes useless but don't hurt, so there
is no need to drop them. This is what this patch changes.

However I realize there is a use case for dropping inferred devlink:
optional suppliers that prevent consumer probing until they are
dropped. Indeed, inferring devlinks from firmware data can create links
that prevent some device to probe. For this reason my first attempts have
been to add or change the devlinks that subsystem code creates.

So a more sophisticated idea is that after phase 1 we try to probe all
not-probed-yet consumers ignoring the relaxed devlinks, instead of removing
them. This would allow the same amount of devices to be probed using the
same amount of optional suppliers, but leaving the inferred devlinks in
place because they might be useful later on.

And then of course there are the above solutions I failed to get working,
which might be the right way but need some directions for me to have them
working.

I am very open to more answers and suggestions.

Best regards,
Luca

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch first appeared in v3.
---
 drivers/base/core.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5c4eebcd198b..024f189fa0a0 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1875,19 +1875,6 @@ void __init wait_for_init_devices_probe(void)
 	fw_devlink_best_effort = false;
 }
 
-static void fw_devlink_unblock_consumers(struct device *dev)
-{
-	struct device_link *link;
-
-	if (!fw_devlink_flags || fw_devlink_is_permissive())
-		return;
-
-	device_links_write_lock();
-	list_for_each_entry(link, &dev->links.consumers, s_node)
-		fw_devlink_relax_link(link);
-	device_links_write_unlock();
-}
-
 #define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
 
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
@@ -3679,14 +3666,6 @@ int device_add(struct device *dev)
 
 	bus_probe_device(dev);
 
-	/*
-	 * If all driver registration is done and a newly added device doesn't
-	 * match with any driver, don't block its consumers from probing in
-	 * case the consumer device is able to operate without this supplier.
-	 */
-	if (dev->fwnode && fw_devlink_drv_reg_done && !dev->can_match)
-		fw_devlink_unblock_consumers(dev);
-
 	if (parent)
 		klist_add_tail(&dev->p->knode_parent,
 			       &parent->p->klist_children);

-- 
2.34.1


