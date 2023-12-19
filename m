Return-Path: <linux-i2c+bounces-880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA9818DBB
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42411B2275F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D5E224F9;
	Tue, 19 Dec 2023 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ixh2ncz6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA94020DE7;
	Tue, 19 Dec 2023 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCC9C1BF20B;
	Tue, 19 Dec 2023 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703006126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wwUidinRNx7RWGe1+c0trzBztgp3LU+5Gjom79tMrrw=;
	b=ixh2ncz6Fm0+a7VlxiI3HYCv7L1BOWoURrAtM4LtVHZkXjiqq/Crxfr4RAngAENHM/xafP
	L40IrAZQuvAlYAz6NOQ+mXo/iEbbTqfzUsqLZD0HxJaKmAAaHgOc5Z6evNk2eemdjTgFwN
	0J+PSuBVVnavKOn5aKRAY4rAi/lKUyDU399dGeOMAUAZYjiZBBr1QJ9wPrZgmhh5a+bOwE
	WRy7N2CMk0Yw+wEwmOP8TuYObRoEvTLpcd+EklxTYzjGtMfKZbutxsGJDx5JQzrTNDP2vk
	jc/Po+qMt2lR44unBbS7+cQ+W4h46WUppQYV11dIxyc5v5Tl+fD9eL+zMH4t9g==
Message-ID: <f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com>
Date: Tue, 19 Dec 2023 18:15:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
Cc: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: omap-i2c: runtime pm issue during suspend to ram
To: linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

Hello,

I have a gpio expander (pca953x driver) connected to an i2c controller
managed by the omap-i2c driver.
And I have some issues with pm_runtime_force_suspend/resume during
suspend to ram.
For some reasons, related to hardware design, I need to access to this
gpio expander during suspend_noirq and resume_noirq. So I had to move
the suspend/resume of the pca953x to suspend_noirq/resume_noirq.

The i2c controller is autosuspended when I start the suspend sequence.
In suspend_noirq, I access to one gpio of the expander, so rpm_resume is
called to resume the i2c controller.
And rpm_resume returns an error because disable_depth > 0 [1]. In
suspend_noirq, runtime pm is disabled (disable_depth is incremented when
runtime pm is disabled [2]). So the expander is not reachable, and the
access fails.

[1]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L773
[2]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1474

The suspend_noirq of the gpio expander don't do i2c access, so no
problem for pca953x suspend.
The pm_runtime_force_suspend (suspend_noirq [3]) of the i2c controller
does nothing as the device is already suspended [4].

[3]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/i2c/busses/i2c-omap.c#L1579
[4]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1878

Then during the pm_runtime_force_resume (resume_noirq [3]) the i2c
controller is not resumed because needs_for_resume is equal to 0 [5].
The needs_for_resume flag is set in pm_runtime_force_suspend [6] but we
don't reach this point, because the device is already suspended [4].

[5]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1929
[6]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L1900

Then the resume_noirq of the pca953x driver is called, consequently
rpm_resume is called to resume the i2c controller. But it is never
resumed because disable_depth > 0 [7] (runtime pm is still disabled in
resume_noirq). So the resume_noirq fails.

[7]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/base/power/runtime.c#L773

I found a workaround which is to resume the controller and disable
runtime pm during suspend, then runtime pm is enabled during resume.
But there is probably a better solution to fix this issue.

Best Regards,

Thomas Richard


diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 42165ef57946..fe79b27b46fd 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1575,9 +1575,24 @@ static int __maybe_unused
omap_i2c_runtime_resume(struct device *dev)
        return 0;
 }

+static int omap_i2c_suspend(struct device *dev)
+{
+       pm_runtime_get_sync(dev);
+       pm_runtime_disable(dev);
+       return 0;
+}
+
+static int omap_i2c_resume(struct device *dev)
+{
+       pm_runtime_enable(dev);
+       pm_runtime_put_autosuspend(dev);
+       return 0;
+}
+
 static const struct dev_pm_ops omap_i2c_pm_ops = {
        SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
                                      pm_runtime_force_resume)
+       SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
        SET_RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
                           omap_i2c_runtime_resume, NULL)
 };




