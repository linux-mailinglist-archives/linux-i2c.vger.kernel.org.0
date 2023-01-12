Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663A7667297
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jan 2023 13:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjALMv1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Jan 2023 07:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjALMvO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Jan 2023 07:51:14 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53534EC8F;
        Thu, 12 Jan 2023 04:51:11 -0800 (PST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pFx2x-0003Hd-VR; Thu, 12 Jan 2023 13:51:08 +0100
Message-ID: <8c3fd22a-9a11-216c-891f-969475745d20@leemhuis.info>
Date:   Thu, 12 Jan 2023 13:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From:   "Linux kernel regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Cc:     Georg <g.wenzel@gmail.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: =?UTF-8?Q?=5bRegression=5d_Bug=c2=a0216913_-_i2c_not_working_after_?=
 =?UTF-8?Q?hibernation_=28i2c=5fdesignware=29?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673527871;1168e515;
X-HE-SMSGID: 1pFx2x-0003Hd-VR
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org that sounds a lot
like it's a regression (it's not totally clear). As many (most?) kernel
developer don't keep an eye on it, I decided to forward it by mail.
Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216913 :

>  Georg 2023-01-11 12:59:15 UTC
> 
> Hi guys,
> on my Lenovo Yoga 7 Gen 7 (14ARB7) with Ryzen CPU, the i2c bus stops working after hibernation.
> 
> Jan 11 10:02:50 yoga kernel: PM: hibernation: hibernation exit
> Jan 11 10:02:50 yoga kernel: ------------[ cut here ]------------
> Jan 11 10:02:50 yoga kernel: i2c i2c-3: Transfer while suspended
> Jan 11 10:02:50 yoga kernel: WARNING: CPU: 4 PID: 2905 at drivers/i2c/i2c-core.h:54 __i2c_smbus_xfer+0x3e7/0x400 [i2c_core]
> Jan 11 10:02:50 yoga kernel: Modules linked in: uvcvideo
> videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videodev
> videobuf2_common btusb btrtl btbcm btintel btmtk snd_ctl_led joydev
> wacom usbhid hid_multitouch snd_hda_codec_realtek snd_soc_acp6x_mach
> snd_acp6x_pdm_dma snd_soc_dmic amdgpu snd_hda_codec_generic i2c_hid_acpi
> drm_ttm_helper i2c_hid ttm snd_pci_ps snd_rpl_pci_acp6x snd_acp_pci
> snd_hda_codec_hdmi gpu_sched i2c_algo_bit drm_buddy snd_pci_acp6x
> drm_display_helper snd_hda_intel mt7921e snd_pci_acp5x snd_intel_dspcfg
> drm_kms_helper mt7921_common snd_hda_codec syscopyarea snd_rn_pci_acp3x
> sysfillrect mt76_connac_lib snd_hwdep snd_acp_config nls_cp437 sysimgblt
> snd_soc_acpi snd_hda_core mt76 snd_pci_acp3x ideapad_laptop
> platform_profile tpm_crb tpm_tis tpm_tis_core tpm
> i2c_designware_platform acpi_tad i2c_designware_core serio_raw
> sch_fq_codel drm i2c_dev i2c_core efivarfs
> Jan 11 10:02:50 yoga kernel: CPU: 4 PID: 2905 Comm: i2cset Not tainted 6.2.0-rc3-x86_64+ #52
> Jan 11 10:02:50 yoga kernel: Hardware name: LENOVO 82QF/LNVNB161216, BIOS K5CN35WW 09/23/2022
> Jan 11 10:02:50 yoga kernel: RIP: 0010:__i2c_smbus_xfer+0x3e7/0x400 [i2c_core]
> Jan 11 10:02:50 yoga kernel: Code: 8b a7 c0 00 00 00 4d 85 e4 75 04 4c 8b 67 70 48 8d 7d 70 e8 bb a6 83 e1 4c 89 e2 48 89 c6 48 c7 c7 10 1b 01 a0 e8 3f f2 ee e1 <0f> 0b 41 bc 94 ff ff ff e9 72 fd ff ff 66 66 2e 0f 1f 84 00 00 00
> Jan 11 10:02:50 yoga kernel: RSP: 0018:ffffc90006d5fda0 EFLAGS: 00010286
> Jan 11 10:02:50 yoga kernel: RAX: 0000000000000000 RBX: 0000000000000048 RCX: 0000000000000027
> Jan 11 10:02:50 yoga kernel: RDX: ffff888761d17408 RSI: 0000000000000001 RDI: ffff888761d17400
> Jan 11 10:02:50 yoga kernel: RBP: ffff8881056160e8 R08: ffffffff82b1eb28 R09: 00000000ffffdfff
> Jan 11 10:02:50 yoga kernel: R10: ffffffff82a3eb40 R11: ffffffff82aeeb40 R12: ffff8881039ba518
> Jan 11 10:02:50 yoga kernel: R13: 0000000000000000 R14: 0000000000000002 R15: 0000000000000002
> Jan 11 10:02:50 yoga kernel: FS:  00007f61e5d84740(0000) GS:ffff888761d00000(0000) knlGS:0000000000000000
> Jan 11 10:02:50 yoga kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Jan 11 10:02:50 yoga kernel: CR2: 00007f61e5de03a5 CR3: 00000002f91de000 CR4: 0000000000750ee0
> Jan 11 10:02:50 yoga kernel: PKRU: 55555554
> Jan 11 10:02:50 yoga kernel: Call Trace:
> Jan 11 10:02:50 yoga kernel:  <TASK>
> Jan 11 10:02:50 yoga kernel:  ? do_filp_open+0xb1/0x160
> Jan 11 10:02:50 yoga kernel:  i2c_smbus_xfer+0x7a/0x120 [i2c_core]
> Jan 11 10:02:50 yoga kernel:  i2cdev_ioctl_smbus+0x181/0x240 [i2c_dev]
> Jan 11 10:02:50 yoga kernel:  i2cdev_ioctl+0x1a2/0x2c0 [i2c_dev]
> Jan 11 10:02:50 yoga kernel:  __x64_sys_ioctl+0xab/0xe0
> Jan 11 10:02:50 yoga kernel:  ? exit_to_user_mode_prepare+0x39/0x130
> Jan 11 10:02:50 yoga kernel:  do_syscall_64+0x43/0x90
> Jan 11 10:02:50 yoga kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0xb5
> Jan 11 10:02:50 yoga kernel: RIP: 0033:0x7f61e5e7c26b
> Jan 11 10:02:50 yoga kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1b 48 8b 44 24 18 64 48 2b 04 25 28 00
> Jan 11 10:02:50 yoga kernel: RSP: 002b:00007ffdcc04a860 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> Jan 11 10:02:50 yoga kernel: RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f61e5e7c26b
> Jan 11 10:02:50 yoga kernel: RDX: 00007ffdcc04a8c0 RSI: 0000000000000720 RDI: 0000000000000003
> Jan 11 10:02:50 yoga kernel: RBP: 0000000000000000 R08: 00007ffdcc04a8f0 R09: 00007ffdcc04a780
> Jan 11 10:02:50 yoga kernel: R10: fffffffffffffd09 R11: 0000000000000246 R12: 0000000000000000
> Jan 11 10:02:50 yoga kernel: R13: 0000000000000003 R14: 0000000000000048 R15: 00007ffdcc04a980
> Jan 11 10:02:50 yoga kernel:  </TASK>
> Jan 11 10:02:50 yoga kernel: ---[ end trace 0000000000000000 ]---
> 
> 
> And the return of i2cget or i2cset is a simple "Error: Read failed" or "Error: Write failed".
> 
> [reply] [−] Comment 1 Georg 2023-01-11 17:16:56 UTC
> 
> I checked some files and found something.
> This solution works for me.
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ba043b547393..289879c56a0c 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -484,7 +484,7 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
>  static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
>         .prepare = dw_i2c_plat_prepare,
>         .complete = dw_i2c_plat_complete,
> -       SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
>         SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
>  };
> 

See the ticket for more details.

Side note: while briefly investigating, I noticed a patch that might or
might not be related:

Richard Fitzgerald -- i2c: designware: Fix unbalanced suspended flag
https://lore.kernel.org/all/20221219130145.883309-1-rf@opensource.cirrus.com/

Therefore CCing Richard. Sorry if this is something totally different.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.0..v6.1
https://bugzilla.kernel.org/show_bug.cgi?id=216913
#regzbot title: i2c: i2c_designware: i2c not working after hibernation
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
