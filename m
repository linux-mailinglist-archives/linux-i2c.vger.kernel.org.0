Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4695D4B3F6E
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 03:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239372AbiBNCbR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Feb 2022 21:31:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbiBNCbP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Feb 2022 21:31:15 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F8B54FBF;
        Sun, 13 Feb 2022 18:31:06 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id t14-20020a17090a3e4e00b001b8f6032d96so14371044pjm.2;
        Sun, 13 Feb 2022 18:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t7n9FdIXHmGPoeiBs9yVgPMo+2CuwYZUc11nF6CXTI8=;
        b=e8oLG0p8ZTsA7vqCEnoNEpvy/wnJEYF/UXWvvL8WTEnfZbeIOU9MO8jVdDiFyTCmgq
         pmGkah4eVTo9WcH4KVGnsiZWzWXnxnvJCYoXldF1dYW7+OupZ0lAQe8R7Yeenhe7NTHy
         IGHcIEie2iaJJ2dbtXqJNIDKEvg/1Ag390kTNEDhDXTTrHRpmM2HPdTB5eeLDd8Mm8OR
         Akt75kGxnaEKm5kMjdoddY2CM66u+aov8Va43ZEOv9gLL9TvXjA/T/hgefP5COVQf6l8
         PgpDkZ7BI2SwvzTNt1mS2MnnGuSXqKEfKvnSKNrxtxMiTYcP+VtfwPS6BfLjVPZEkm3f
         fRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t7n9FdIXHmGPoeiBs9yVgPMo+2CuwYZUc11nF6CXTI8=;
        b=Kzbu1znflFtBM3oYRTyC05rLrLB+EfEKY6aF8sK3tAGZHiD436RHhC1RxWAD21rEGS
         AOTvyMOMMtzItVeu4NCxpDJgsUJRMOa3LfB+pW/KSSJUXPJ9CzBR/WNfzNTih3VNaIZK
         QqZ7oFku//kBzDFM01HoZAwMl5x6oj5k/b2GkOH5aFjpFS0GQhDGmyOvsdoPIQvy5Orb
         onW00eNc76BuU9GhIVMsGKTo+ZAGLR2YhIa+aM254kPGQccAcBpxPmz99IjEwS2eCi4v
         zny67XVjuNPC/iYfIbL72sBbVqbam0057B/iowgGaHk3hxH8p8rK/HruRK1Wl+JkcQkY
         3PkA==
X-Gm-Message-State: AOAM531QVfxyYcFpgfhk/vKxLaNYL51FFVg24zyK9SSLWoaCQ3UEKaKo
        JUT0EdFOd+Ti9b70+fZUWSs=
X-Google-Smtp-Source: ABdhPJziFmAkXPlAzrlbtNSzweoQAatE/m45tBeeDuCtEp1cRS6UMXy+zruE6Y2E/4xrxD5bQnY3eQ==
X-Received: by 2002:a17:90b:3b8f:: with SMTP id pc15mr12134402pjb.165.1644805866194;
        Sun, 13 Feb 2022 18:31:06 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bfd9:7c7:cdd6:dcdc])
        by smtp.gmail.com with ESMTPSA id h21sm34182893pfv.135.2022.02.13.18.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 18:31:05 -0800 (PST)
Date:   Sun, 13 Feb 2022 18:31:02 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Hugh Dickins <hughd@google.com>, Rajat Jain <rajatja@google.com>,
        Wolfram Sang <wsa@kernel.org>,
        Derek Basehore <dbasehore@chromium.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        vincent.huang@tw.synaptics.com, cheiny@synaptics.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
Message-ID: <Ygm+5rS7Cxeea5Dp@google.com>
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
 <YgF/0QGFN4SppLKg@shikoro>
 <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
 <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com>
 <YgHTYrODoo2ou49J@google.com>
 <b76771e5-b8e-54c9-2474-d5a73d236cba@google.com>
 <6f1103af-595c-ed0a-b946-97a9331ed148@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1103af-595c-ed0a-b946-97a9331ed148@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hugh, Jarkko,

On Tue, Feb 08, 2022 at 04:57:53PM +0200, Jarkko Nikula wrote:
> Hi
> 
> On 2/8/22 04:50, Hugh Dickins wrote:
> > On Mon, 7 Feb 2022, Dmitry Torokhov wrote:
> > > On Mon, Feb 07, 2022 at 01:41:36PM -0800, Rajat Jain wrote:
> > > > > > > Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> > > > > > > ("i2c: enable async suspend/resume on i2c client devices")
> > > > > > > and reverting that fixes it for me.
> > > > > > 
> > > > > > Thank you for the report plus bisection and sorry for the regression!
> > > > > 
> > > > > +1, Thanks for the bisection, and apologies for the inconveniences.
> > > > > 
> > > > > The problem here seems to be that for some reason, some devices (all
> > > > > connected to rmi4 adapter) failed to resume, but only when
> > > > > asynchronous suspend is enabled (by 172d931910e1):
> > > > > 
> > > > > [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
> > > > > [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
> > > > > to read current IRQ mask.
> > > > > [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
> > > > > [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
> > > > > [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
> > > > > [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
> > > > > [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
> > > > > 
> 
> v5.17-rc3 on Lenovo ThinkPad X1 Carbon 8th don't even suspend due the same
> commit 172d931910e1. Sadly I tested the original patch on other machine(s)
> but not on this one with rmi4 :-(
> 
> [   39.957293] PM: suspend entry (s2idle)
> [   40.938666] Filesystems sync: 0.980 seconds
> [   40.942751] Freezing user space processes ... (elapsed 0.001 seconds)
> done.
> [   40.945511] OOM killer disabled.
> [   40.946111] Freezing remaining freezable tasks ... (elapsed 0.001
> seconds) done.
> [   40.948590] printk: Suspending console(s) (use no_console_suspend to
> debug)
> [   40.993123] i801_smbus 0000:00:1f.4: No response
> [   40.993218] rmi4_f01 rmi4-00.fn01: Failed to write sleep mode: -6.
> [   40.993232] rmi4_f01 rmi4-00.fn01: Suspend failed with code -6.
> [   40.993241] rmi4_physical rmi4-00: Failed to suspend functions: -6
> [   40.993404] rmi4_smbus 1-002c: Failed to suspend device: -6
> [   40.993414] PM: dpm_run_callback(): rmi_smb_suspend+0x0/0x30 [rmi_smbus]
> returns -6
> [   40.993438] rmi4_smbus 1-002c: PM: failed to suspend async: error -6
> [   41.014198] PM: Some devices failed to suspend, or early wake event
> detected
> [   41.021544] i801_smbus 0000:00:1f.4: No response
> [   41.021612] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Failed to write to
> F03 TX register (-6).
> [   41.022189] i801_smbus 0000:00:1f.4: No response
> [   41.022230] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Failed to write to
> F03 TX register (-6).
> [   41.023480] i801_smbus 0000:00:1f.4: No response
> [   41.023542] rmi4_physical rmi4-00: rmi_driver_clear_irq_bits: Failed to
> change enabled interrupts!
> [   41.033850] i801_smbus 0000:00:1f.4: No response
> [   41.034006] OOM killer enabled.
> [   41.035449] i801_smbus 0000:00:1f.4: No response
> [   41.035722] Restarting tasks ...
> [   41.036705] rmi4_physical rmi4-00: rmi_driver_set_irq_bits: Failed to
> change enabled interrupts!
> [   41.038367] done.
> [   41.039003] psmouse: probe of serio2 failed with error -1
> [   41.071700] PM: suspend exit

Sorry for the delay, but I wonder if you could try the patch below and
tell me if that also fixes the issue for you?

Also adding Hans as to make sure changes to psmouse_smbus make sense to
him.

Thanks!

diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
index a472489ccbad..164f6c757f6b 100644
--- a/drivers/input/mouse/psmouse-smbus.c
+++ b/drivers/input/mouse/psmouse-smbus.c
@@ -75,6 +75,8 @@ static void psmouse_smbus_detach_i2c_client(struct i2c_client *client)
 				    "Marking SMBus companion %s as gone\n",
 				    dev_name(&smbdev->client->dev));
 			smbdev->dead = true;
+			device_link_remove(&smbdev->client->dev,
+					   &smbdev->psmouse->ps2dev.serio->dev);
 			serio_rescan(smbdev->psmouse->ps2dev.serio);
 		} else {
 			list_del(&smbdev->node);
@@ -174,6 +176,8 @@ static void psmouse_smbus_disconnect(struct psmouse *psmouse)
 		kfree(smbdev);
 	} else {
 		smbdev->dead = true;
+		device_link_remove(&smbdev->client->dev,
+				   &psmouse->ps2dev.serio->dev);
 		psmouse_dbg(smbdev->psmouse,
 			    "posting removal request for SMBus companion %s\n",
 			    dev_name(&smbdev->client->dev));
@@ -270,6 +274,12 @@ int psmouse_smbus_init(struct psmouse *psmouse,
 
 	if (smbdev->client) {
 		/* We have our companion device */
+		if (!device_link_add(&smbdev->client->dev,
+				     &psmouse->ps2dev.serio->dev,
+				     DL_FLAG_STATELESS))
+			psmouse_warn(psmouse,
+				     "failed to set up link with iSMBus companion %s\n",
+				     dev_name(&smbdev->client->dev));
 		return 0;
 	}
 

-- 
Dmitry
