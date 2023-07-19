Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51DE8759E85
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jul 2023 21:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjGST1p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jul 2023 15:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjGST1o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jul 2023 15:27:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DADB1FC0;
        Wed, 19 Jul 2023 12:27:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D86DF617C7;
        Wed, 19 Jul 2023 19:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2600C433C8;
        Wed, 19 Jul 2023 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689794862;
        bh=zt97BOS4bdaf5dk0BTyo2CkiDC24s45caGLHh2EraIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YwooUnVURGjtn39uuMPKbvd9Kg5I5N5jMhKue1gC/8oz9wwyrWZMIGzyDx048OL32
         me5OxxVjX46hhFw9GDXMF3boPMxFG9JqMYFFPAlOmoXyT9XK+DWSDAENYgnr9YNMfh
         TJhdhSyhUFxd7vRa6rwn65wyA2JzM25aIm/Ya4Gbc5DM6fJuofZqjjk0GSA4WeylX8
         UkHZRuejfzcMJOm795J33EpV1KRAmfN72rMpHX+pr05ajPEMWGuf01CtT+53L+DEIe
         BqEZrRjt+zmh4yfvkHUnoJo5faXVOMblGMGRm1R3gAsdpmAUPxf4mPZWlGiWtnZNvB
         Vgg1+Qh/SauoA==
Received: by pali.im (Postfix)
        id 231287CA; Wed, 19 Jul 2023 21:27:39 +0200 (CEST)
Date:   Wed, 19 Jul 2023 21:27:39 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Marius Hoch <mail@mariushoch.de>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Message-ID: <20230719192739.z5mnlcfxczjayjri@pali>
References: <20230514103634.235917-1-mail@mariushoch.de>
 <20230523200350.62ab4788@endymion.delvare>
 <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
 <20230604160132.102dd6a7@endymion.delvare>
 <967411b3-7013-619e-4fef-90644fa8d489@mariushoch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <967411b3-7013-619e-4fef-90644fa8d489@mariushoch.de>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello! In your log is one important information.

On Sunday 18 June 2023 15:42:40 Marius Hoch wrote:
> Hi Jean,
> 
> thanks again for all the helpful replies!
> 
> On 04/06/2023 16:01, Jean Delvare wrote:
> > Hi Marius,
> > 
> > On Sat, 3 Jun 2023 11:24:02 +0200, Marius Hoch wrote:
> > > On 23/05/2023 20:03, Jean Delvare wrote:
> > > > On Sun, 14 May 2023 12:36:32 +0200, Marius Hoch wrote:
> > > > > The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
> > > > > but also claims that the SMBus uses IRQ 18. This will
> > > > > result in:
> > > > > 
> > > > > i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
> > > > > i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
> > > > > i801_smbus: probe of 0000:00:1f.3 failed with error -16
> > > > The i2c-i801 driver supports shared IRQ. If this fails, this means that
> > > > the other driver is not passing IRQF_SHARED when registering the
> > > > interrupt. Which driver is this? I'd rather check whether sharing the
> > > > IRQ is possible, rather that falling back to polling, which has a
> > > > performance cost.
> > > I don't think this is a conflict rather than a completely bogus entry:
> > > smo8800 uses IRQ 18 (the freefall sensor).
> > You're probably right. I admit I misread your report originally and
> > thought requesting the IRQ was failing. But actually the failure
> > happens before that, when enabling the PCI device. So its not related
> > to sharing the interrupt.
> > 
> > > For the SMBus in acpi_pci_irq_enable, acpi_register_gsi fails for GSI 18
> > > with IRQ 255 (dev->irq), independently from the presence of the
> > > dell_smo8800 module.
> > > 
> > > Now looking into this again, seeing dev->irq at 255 seems very
> > > suspicious here? Doesn't that mean not connected (although I'm not sure
> > > how this relates to it supposedly having GSI 18)?
> > I admit I don't know. I'm not familiar with how GSI numbers relate to
> > IRQ numbers. I think I understand that GSI numbers are an ACPI thing,
> > and the ACPI layer is responsible for mapping these to actual IRQ
> > numbers? Is there a GSI-to-IRQ table available somewhere as part of the
> > ACPI tables? If so, it would be interesting to disassemble the ACPI
> > tables on your system and check what this looks like for you.
> > 
> > If this is a bug in the ACPI data then it might be worth booting with
> > acpi=noirq and see if it helps. This option might break other things
> > though (like free fall detection or thermal management) so be cautious.
> I just booted with acpi=noirq, the PCI device no longer fails to be enabled
> and the device got assigned IRQ 19 now (according to lspci -v/
> proc/interrupts), while the freefall device remained at IRQ 18.
> Interestingly dmesg is full of spam from the freefall device (endlessly
> reporting that freefall got detected, probably indicating a problem in IRQ
> handling, yikes).
> 
> Booting without the smo8800 module results in:
> [root@fedora ~]# dmesg | grep -i smbus
> [   20.042515] i801_smbus 0000:00:1f.3: PCI->APIC IRQ transform: INT C ->
> IRQ 19
> [   20.042548] i801_smbus 0000:00:1f.3: SPD Write Disable is set
> [   20.042574] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
> [   20.051270] i801_smbus 0000:00:1f.3: Accelerometer lis3lv02d is present
> on SMBus but its address is unknown, skipping registration

The accelerometer with "conflicting" interrupt line is connected via
that same SMBus. You could be able to detects its address via i2cdetect
and manually load via: echo lis3lv02d [address] > /sys/.../new_device

My guess, are not all devices on SMBus using same shared interrupt line?
