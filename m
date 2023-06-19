Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3004E735AFD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjFSPTR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjFSPTQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:19:16 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558CB9B;
        Mon, 19 Jun 2023 08:19:15 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0DB961F88B;
        Mon, 19 Jun 2023 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687187954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BxX0JR9pCiqX52Q86QN+MVAg4XLHJ++XGVzlT7hnH14=;
        b=g+YutJ0hLg8FV8N7BnfQi4VR/A8bq9g/lIidDNG3k4i1JkpFe+BJdnOx9ZuJ5XTqP61T7N
        wxfB9Ep1ev8uV0C/OhnGKTsF3xO3L5kSfjzV3gQ+d8mz7a/6Y+dmtpT7pAiQpBCcpZqapw
        tQik1aixlJIXoSQn2K+tarMHBd761rU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687187954;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BxX0JR9pCiqX52Q86QN+MVAg4XLHJ++XGVzlT7hnH14=;
        b=bIQmVuT6O2DhUaekn7EDcUK8P+v+BH7/hZFFW81fcngvvWtsgrZIGgwABzZDRpCDmM+1yG
        XlEIW71I6CsfUmDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC759139C2;
        Mon, 19 Jun 2023 15:19:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ps8TNPFxkGTDOwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 19 Jun 2023 15:19:13 +0000
Date:   Mon, 19 Jun 2023 17:19:12 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Marius Hoch <mail@mariushoch.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Message-ID: <20230619171912.5407a7eb@endymion.delvare>
In-Reply-To: <967411b3-7013-619e-4fef-90644fa8d489@mariushoch.de>
References: <20230514103634.235917-1-mail@mariushoch.de>
        <20230523200350.62ab4788@endymion.delvare>
        <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
        <20230604160132.102dd6a7@endymion.delvare>
        <967411b3-7013-619e-4fef-90644fa8d489@mariushoch.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 18 Jun 2023 15:42:40 +0200, Marius Hoch wrote:
> I just booted with acpi=3Dnoirq, the PCI device no longer fails to be=20
> enabled and the device got assigned IRQ 19 now (according to lspci -v/=20
> proc/interrupts), while the freefall device remained at IRQ 18.
> Interestingly dmesg is full of spam from the freefall device (endlessly=20
> reporting that freefall got detected, probably indicating a problem in=20
> IRQ handling, yikes).

Unfortunately, while acpi=3Dnoirq can be useful for testing purposes and
bug investigation, there's no guarantee that a modern x86 system can
actually work properly without ACPI-based PCI routing.

> Booting without the smo8800 module results in:
> [root@fedora ~]# dmesg | grep -i smbus
> [=C2=A0=C2=A0 20.042515] i801_smbus 0000:00:1f.3: PCI->APIC IRQ transform=
: INT C=20
> -> IRQ 19 =20
> [=C2=A0=C2=A0 20.042548] i801_smbus 0000:00:1f.3: SPD Write Disable is set
> [=C2=A0=C2=A0 20.042574] i801_smbus 0000:00:1f.3: SMBus using PCI interru=
pt
> [=C2=A0=C2=A0 20.051270] i801_smbus 0000:00:1f.3: Accelerometer lis3lv02d=
 is=20
> present on SMBus but its address is unknown, skipping registration
> [=C2=A0=C2=A0 20.253942] i801_smbus 0000:00:1f.3: Transaction timeout
> [=C2=A0=C2=A0 20.461962] i801_smbus 0000:00:1f.3: Transaction timeout
>=20
> The "Transaction timeout" messages might indicate that interrupt routing=
=20
> isn't actually working?

Indeed. This means the driver waited for an interrupt but was never
called back.

--=20
Jean Delvare
SUSE L3 Support
