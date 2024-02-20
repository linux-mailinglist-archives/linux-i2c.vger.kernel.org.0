Return-Path: <linux-i2c+bounces-1880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D932B85C478
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 20:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DD05283CFD
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 19:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022A4135A4D;
	Tue, 20 Feb 2024 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dNQLK6a3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316F1353EA
	for <linux-i2c@vger.kernel.org>; Tue, 20 Feb 2024 19:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708456544; cv=none; b=HGJBRRnaqKfDJ/Y9Ihys1cq4KYyZxWY1Y/PV2KDCQW49hl0JJJiErZWOF/7B3+rWyx7bzkYguKgzkPwP46zbEh76/SuuNkfIimQDQGWO0Jr6IQASYwES+vYT7JSvqtxnoVIAQyRoLCYYexRsdbpLGunPV3Ew9ij+tvyQC5QTNlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708456544; c=relaxed/simple;
	bh=ug9gShDwPfXb7+RC32bHzUadxNMQP5At8HNH5vVUURc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nkx3sR0BWkpRnRE4n78rjV7PzbkPPHPxy6fFAxNmgHfmjuHp/xJELVoOilrceemDOsTwZvesGQk8fgyqsCJaQsjFMs2EQpeKFhxWBG7SygmD+1k0O/SPBumhrSGN0YNqfDChS7DjEhhg3LlSKMHCq7SWoqz68mZTuL6VbUgjm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dNQLK6a3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708456541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbYHQyJEJ73mSk/R9gEn8hmKc8A4snzJLSWzAxj1WSI=;
	b=dNQLK6a3f0qZSScjo58uJ8wxH8R/BNe7LDVilTZtOV6TeEAJ8MEDrrqF/+0/a2w/2d5A/O
	mjhkN4LN20wWbtY4JgAj/pV/Gevna/CRnopPuAkfJXml61CexVbEv07qcfgye+RdTVFkrq
	la/EgP77lCAOsmUcZgCzpcHgp/jv7dc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-alcMiR0HOdutXykYV6ml7Q-1; Tue, 20 Feb 2024 14:15:39 -0500
X-MC-Unique: alcMiR0HOdutXykYV6ml7Q-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50e91f9d422so6769251e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 Feb 2024 11:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708456538; x=1709061338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbYHQyJEJ73mSk/R9gEn8hmKc8A4snzJLSWzAxj1WSI=;
        b=Vw2UF7V4SLxdjZL638wPoKvo3z54ts0jdEe4Wal8skncips3Ip+sBWLs8GWAwdRf/u
         gLDhf5fU88w7mGaHyWckclqzv0FejVxLKP8R3CJZ6OFFoYAcFt0TwU0wJ2M3mmy8X7/j
         K36B3wVgENncnFTRn9ydLQT74sE/wyaDOLXnhNbCF8VjfB2JCaJCjhJFqeQ+u9phg87s
         yo6RqKpeRvZArAtMiy28/8Zo16sgIGNQf+GqAyJMC20SN7ERJ0NtHUOdhJGfSZnEEAYd
         lJ9+hAMNtYPJNNPmjx58vRGZU0U0hKY0fWIro8Uzyk/gAQB1zGv+f3nCEA2+4KsJznto
         1P4A==
X-Gm-Message-State: AOJu0Yw9vjPlnvIuhgySXO7HK/T3NciG4PPVyJZvTmgLi5lvYr+B9Gxt
	IFybvMPyLTQzCTJE+bT8pDcU6ZEUJ9sxn0Y0oEmmvE8dX9HQpLVc4+DcxFJPG79JflDXq7z8kl0
	DXH730erqZwaveIV4H1aNSkt5+O77lkqudDuk/IJr9cxpb+PbqFRn4+gdyw==
X-Received: by 2002:ac2:414c:0:b0:512:b6b4:739c with SMTP id c12-20020ac2414c000000b00512b6b4739cmr3922164lfi.60.1708456538151;
        Tue, 20 Feb 2024 11:15:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbsU0K4z8xxpCoZpFPXa2x6ux2JexcwGzyXt0jJXOwTln/Osf+0YRqcZ4jmpuxF9Az03UL9A==
X-Received: by 2002:ac2:414c:0:b0:512:b6b4:739c with SMTP id c12-20020ac2414c000000b00512b6b4739cmr3922148lfi.60.1708456537757;
        Tue, 20 Feb 2024 11:15:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b00a3f27031d7bsm154071ejc.104.2024.02.20.11.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 11:15:37 -0800 (PST)
Message-ID: <86968600-34ba-490a-9543-1a6958a93faf@redhat.com>
Date: Tue, 20 Feb 2024 20:15:36 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] `lis3lv02d_i2c_suspend()` causes `unbalanced
 disables for regulator-dummy` and `Failed to disable Vdd_IO: -EIO`
Content-Language: en-US, nl
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On 2/2/24 12:38, Paul Menzel wrote:
> #regzbot introduced 2f189493ae32
> 
> 
> Dear Linux folks,
> 
> 
> Testing commit 2f189493ae32 (i2c: i801: Add lis3lv02d for Dell XPS 15 7590) [1], it’s very likely this commit, it turns out, that Linux logs the warning below during ACPI S3 suspend:

This is actually happening on all models in the DMI match list for creating
an lis3lv02d i2c-client if a SM88xx ACPI device is present.

This is caused by:
b1b9f7a49440 ("misc: lis3lv02d_i2c: Add missing setting of the reg_ctrl callback")

Which fixed lis3lv02d_poweroff() never turning off the regulators.

But that exposed a bug in the suspend/resume handling.

I have reproduced this on a Latitude E6430 and I'veposted a fix for
the suspend resume handling upstream:
https://lore.kernel.org/regressions/20240220190035.53402-1-hdegoede@redhat.com/

Regards,

Hans






> ```
> [    0.000000] Linux version 6.8.0-rc2 (pmenzel@villette) (gcc (Debian 13.2.0-12) 13.2.0, GNU ld (GNU Binutils for Debian) 2.41.90.20240122) #9 SMP PREEMPT_DYNAMIC Mon Jan 29 15:49:07 CET 2024
> [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.8.0-rc2 root=UUID=9fa41e21-7a5f-479e-afdc-9a5503368d8e ro cryptomgr.notests quiet rd.luks=1 rd.auto=1 initcall_debug log_buf_len=8M
> […]
> [    0.000000] DMI: Dell Inc. XPS 15 7590/0VYV0G, BIOS 1.24.0 09/11/2023
> […]
> [ 1528.577767] lis3lv02d_i2c 0-0029: PM: calling lis3lv02d_i2c_suspend+0x0/0x30 [lis3lv02d_i2c] @ 92, parent: i2c-0
> […]
> [ 1528.578506] ------------[ cut here ]------------
> [ 1528.578508] unbalanced disables for regulator-dummy
> [ 1528.578522] WARNING: CPU: 1 PID: 92 at drivers/regulator/core.c:2999 _regulator_disable+0xbb/0x190
> [ 1528.578532] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd_seq(E) snd_seq_device(E) rfcomm(E) snd_sof_probes(E) snd_hda_codec_hdmi(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) l2tp_ppp(E) l2tp_netlink(E) l2tp_core(E) ip6_udp_tunnel(E) udp_tunnel(E) pppox(E) ppp_generic(E) slhc(E) xfrm_interface(E) xfrm6_tunnel(E) tunnel6(E) xfrm_user(E) xfrm_algo(E) qrtr(E) cmac(E) algif_hash(E) algif_skcipher(E) af_alg(E) bnep(E) snd_sof_pci_intel_cnl(E) snd_sof_intel_hda_common(E) snd_sof_pci(E) snd_sof_xtensa_dsp(E) snd_sof_intel_hda(E) snd_sof(E) snd_sof_utils(E) snd_soc_acpi_intel_match(E) snd_soc_acpi(E) snd_soc_hdac_hda(E) binfmt_misc(E) iwlmvm(E) snd_soc_core(E) snd_compress(E) snd_sof_intel_hda_mlink(E) x86_pkg_temp_thermal(E) wacom(E) snd_hda_ext_core(E) intel_powerclamp(E) i915(E) mac80211(E) joydev(E) coretemp(E) iTCO_wdt(E) usbhid(E) hid_multitouch(E) kvm_intel(E) intel_pmc_bxt(E) lis3lv02d_i2c(E) hid_generic(E) iTCO_vendor_support(E) dell_laptop(E)
> snd_hda_intel(E) lis3lv02d(E) dell_wmi(E) mei_wdt(E)
> [ 1528.578601]  nls_ascii(E) ledtrig_audio(E) ee1004(E) mei_hdcp(E) libarc4(E) mei_pxp(E) watchdog(E) nls_cp437(E) snd_intel_dspcfg(E) kvm(E)
> [ 1528.578609] idma64 idma64.1: PM: platform_pm_suspend+0x0/0x50 returned 0 after 742 usecs
> [ 1528.578612]  snd_hda_codec(E) btusb(E) snd_hwdep(E) vfat(E) i2c_algo_bit(E) processor_thermal_device_pci_legacy(E) btrtl(E) uvcvideo(E) snd_hda_core(E) dell_smbios(E) btintel(E) fat(E)
> [ 1528.578623] platform regulatory.0: PM: calling platform_pm_suspend+0x0/0x50 @ 70543, parent: platform
> [ 1528.578625]  videobuf2_vmalloc(E) dcdbas(E) intel_rapl_msr(E) snd_pcm(E) irqbypass(E)
> [ 1528.578628] platform regulatory.0: PM: platform_pm_suspend+0x0/0x50 returned 0 after 0 usecs
> [ 1528.578632]  drm_buddy(E) intel_soc_dts_iosf(E) dell_wmi_sysman(E) videobuf2_memops(E) btbcm(E) rapl(E) processor_thermal_device(E) uvc(E) iwlwifi(E)
> [ 1528.578639] iTCO_wdt iTCO_wdt: PM: calling platform_pm_suspend+0x0/0x50 @ 70543, parent: 0000:00:1f.4
> [ 1528.578641]  dell_smm_hwmon(E) ttm(E) videobuf2_v4l2(E) mxm_wmi(E)
> [ 1528.578644] iTCO_wdt iTCO_wdt: PM: platform_pm_suspend+0x0/0x50 returned 0 after 0 usecs
> [ 1528.578646]  snd_timer(E) firmware_attributes_class(E) wmi_bmof(E) intel_cstate(E) btmtk(E) dell_wmi_descriptor(E) intel_wmi_thunderbolt(E) processor_thermal_wt_hint(E) processor_thermal_rfim(E) intel_uncore(E) psmouse(E) bluetooth(E) pcspkr(E) drm_display_helper(E) i2c_i801(E) snd(E)
> [ 1528.578661] intel_rapl_msr intel_rapl_msr.0: PM: calling platform_pm_suspend+0x0/0x50 @ 70543, parent: platform
> [ 1528.578663]  processor_thermal_rapl(E) video(E) videodev(E) drm_kms_helper(E) cfg80211(E) soundcore(E)
> [ 1528.578667] intel_rapl_msr intel_rapl_msr.0: PM: platform_pm_suspend+0x0/0x50 returned 0 after 0 usecs
> [ 1528.578670]  i2c_smbus(E) intel_rapl_common(E)
> [ 1528.578667] i2c_hid_acpi i2c-WCOM490B:00: PM: calling acpi_subsys_suspend+0x0/0x60 @ 88, parent: i2c-1
> [ 1528.578672]  intel_lpss_pci(E) videobuf2_common(E) cec(E) mei_me(E) processor_thermal_wt_req(E) intel_lpss(E) processor_thermal_power_floor(E) ecdh_generic(E) thunderbolt(E)
> [ 1528.578679] idma64 idma64.0: PM: calling platform_pm_suspend+0x0/0x50 @ 70543, parent: 0000:00:15.0
> [ 1528.578683]  mc(E) cdc_acm(E) mei(E) rfkill(E) rc_core(E) idma64(E) processor_thermal_mbox(E) intel_pch_thermal(E) int3403_thermal(E) int340x_thermal_zone(E) dell_smo8800(E) wmi(E) button(E) intel_hid(E) evdev(E) battery(E) int3400_thermal(E) sparse_keymap(E) acpi_thermal_rel(E) acpi_pad(E) ac(E) parport_pc(E) ppdev(E) lp(E) parport(E) fuse(E) loop(E) efi_pstore(E) configfs(E) nfnetlink(E) ip_tables(E) x_tables(E) ext4(E) crc32c_generic(E) crc16(E) mbcache(E) jbd2(E) dm_crypt(E) nvme(E) rtsx_pci_sdmmc(E) xhci_pci(E) i2c_hid_acpi(E) nvme_core(E) i2c_hid(E) mmc_core(E) ahci(E) xhci_hcd(E) hid(E) t10_pi(E) libahci(E) crc64_rocksoft_generic(E) crc32_pclmul(E) ucsi_acpi(E) crc64_rocksoft(E) crc32c_intel(E) libata(E) typec_ucsi(E) crc_t10dif(E) ghash_clmulni_intel(E) crct10dif_generic(E) drm(E) roles(E) sha512_ssse3(E) usbcore(E) crct10dif_pclmul(E) sha256_ssse3(E) crc64(E) scsi_mod(E) sha1_ssse3(E) rtsx_pci(E) typec(E) crct10dif_common(E) scsi_common(E) usb_common(E)
> serio_raw(E) dm_mirror(E) dm_region_hash(E) dm_log(E)
> [ 1528.578760]  dm_mod(E) msr(E) efivarfs(E) autofs4(E) aesni_intel(E) crypto_simd(E) cryptd(E)
> [ 1528.578768] CPU: 1 PID: 92 Comm: kworker/u24:5 Tainted: G E      6.8.0-rc2 #9
> [ 1528.578773] Hardware name: Dell Inc. XPS 15 7590/0VYV0G, BIOS 1.24.0 09/11/2023
> [ 1528.578775] Workqueue: events_unbound async_run_entry_fn
> [ 1528.578783] RIP: 0010:_regulator_disable+0xbb/0x190
> [ 1528.578789] Code: 56 c7 45 0c 00 00 00 00 eb a8 48 8b 85 a8 03 00 00 48 85 c0 74 2a 48 8b 30 48 85 f6 74 22 48 c7 c7 6f a1 45 b9 e8 55 86 8b ff <0f> 0b 41 bc fb ff ff ff 5b 5d 44 89 e0 41 5c 41 5d c3 cc cc cc cc
> [ 1528.578793] RSP: 0018:ffffa2a3403e3d48 EFLAGS: 00010282
> [ 1528.578796] RAX: 0000000000000000 RBX: ffff8bd0456ee300 RCX: 0000000000000027
> [ 1528.578799] RDX: ffff8bd79a061708 RSI: 0000000000000001 RDI: ffff8bd79a061700
> [ 1528.578801] RBP: ffff8bd041304000 R08: 0000000000000000 R09: ffff8bd8bc03adff
> [ 1528.578803] R10: ffffffffffffffff R11: 20726f662073656c R12: ffffffffc10692c8
> [ 1528.578805] R13: 0000000000000002 R14: ffffffffc10692a8 R15: 0000000000000001
> [ 1528.578808] FS:  0000000000000000(0000) GS:ffff8bd79a040000(0000) knlGS:0000000000000000
> [ 1528.578811] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1528.578813] CR2: 000055742d2f3e06 CR3: 0000000466020004 CR4: 00000000003706f0
> [ 1528.578816] Call Trace:
> [ 1528.578819]  <TASK>
> [ 1528.578820]  ? _regulator_disable+0xbb/0x190
> [ 1528.578825]  ? __warn+0x81/0x130
> [ 1528.578832]  ? _regulator_disable+0xbb/0x190
> [ 1528.578837]  ? report_bug+0x171/0x1a0
> [ 1528.578847]  ? handle_bug+0x3c/0x80
> [ 1528.578852]  ? exc_invalid_op+0x17/0x70
> [ 1528.578856]  ? asm_exc_invalid_op+0x1a/0x20
> [ 1528.578863]  ? _regulator_disable+0xbb/0x190
> [ 1528.578869]  ? _regulator_disable+0xbb/0x190
> [ 1528.578874]  regulator_bulk_disable+0x8e/0x180
> [ 1528.578880]  ? __pfx_lis3lv02d_i2c_suspend+0x10/0x10 [lis3lv02d_i2c]
> [ 1528.578890]  lis3lv02d_i2c_suspend+0x24/0x30 [lis3lv02d_i2c]
> [ 1528.578898]  dpm_run_callback+0x89/0x1e0
> [ 1528.578906]  __device_suspend+0xf1/0x4f0
> [ 1528.578912]  async_suspend+0x1e/0x70
> [ 1528.578918]  async_run_entry_fn+0x31/0x130
> [ 1528.578924]  process_one_work+0x171/0x340
> [ 1528.578930]  worker_thread+0x27b/0x3a0
> [ 1528.578936]  ? __pfx_worker_thread+0x10/0x10
> [ 1528.578940]  kthread+0xe5/0x120
> [ 1528.578944]  ? __pfx_kthread+0x10/0x10
> [ 1528.578948]  ret_from_fork+0x31/0x50
> [ 1528.578952]  ? __pfx_kthread+0x10/0x10
> [ 1528.578955]  ret_from_fork_asm+0x1b/0x30
> [ 1528.578965]  </TASK>
> [ 1528.578967] ---[ end trace 0000000000000000 ]---
> [ 1528.578970] Failed to disable Vdd_IO: -EIO
> [ 1528.578974] lis3lv02d_i2c 0-0029: PM: lis3lv02d_i2c_suspend+0x0/0x30 [lis3lv02d_i2c] returned 0 after 1190 usecs
> ```
> 
> Unfortunately, this is out of my expertise, so any help is appreciated.
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://git.kernel.org/linus/2f189493ae32be9768b27072c9388e62b38d2dda
> 


