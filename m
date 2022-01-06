Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E37C486578
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 14:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239695AbiAFNpC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 08:45:02 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58680 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239694AbiAFNpB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 08:45:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 843A1B82105;
        Thu,  6 Jan 2022 13:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A505EC36AE3;
        Thu,  6 Jan 2022 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641476699;
        bh=ntE/Y+7o0IsGTHSw+lmJdSWw0JHksN40xWyROfk/54U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ELqzr9C8O0LJsCjiNHU36w+YcUGG9BIWHkyY4JOpY33l1yPDztjNi9c9zBna9C66x
         stgAppO8kNN3QlcPkknPvywO0mRGGn1HuZxjSJpOkE8pylh2M9X8nS2AkMP9gPZ3YL
         5VkYqTqM5HRE5qn1Rt0ndr3L47sQQuaYSofmzCGqTFDpfXql4ghd3EYj3fkNCCGauc
         VgcJnHp5/0VBWeNuT3MNwHLH1/ou30yaiuyUm2qbmxfaks2GbahBdct8RF/TnLltGI
         QFlKj0vTWQ4LRLffqgH2jpAtkp5vAHkUxDgbs7PvX1sl+j5PDXxYr8E6LbRawhDiZn
         Z9DDFSHVToEWQ==
Date:   Thu, 6 Jan 2022 14:44:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     mbizon@freebox.fr, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mpc: Avoid out of bounds memory access
Message-ID: <YdbyWBujbFNde6K6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        mbizon@freebox.fr, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220105015304.1368234-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/JNsJdIKddWpXUvk"
Content-Disposition: inline
In-Reply-To: <20220105015304.1368234-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/JNsJdIKddWpXUvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 02:53:04PM +1300, Chris Packham wrote:
> When performing an I2C transfer where the last message was a write KASAN
> would complain:
>=20
>   BUG: KASAN: slab-out-of-bounds in mpc_i2c_do_action+0x154/0x630
>   Read of size 2 at addr c814e310 by task swapper/2/0
>=20
>   CPU: 2 PID: 0 Comm: swapper/2 Tainted: G    B             5.16.0-rc8 #1
>   Call Trace:
>   [e5ee9d50] [c08418e8] dump_stack_lvl+0x4c/0x6c (unreliable)
>   [e5ee9d70] [c02f8a14] print_address_description.constprop.13+0x64/0x3b0
>   [e5ee9da0] [c02f9030] kasan_report+0x1f0/0x204
>   [e5ee9de0] [c0c76ee4] mpc_i2c_do_action+0x154/0x630
>   [e5ee9e30] [c0c782c4] mpc_i2c_isr+0x164/0x240
>   [e5ee9e60] [c00f3a04] __handle_irq_event_percpu+0xf4/0x3b0
>   [e5ee9ec0] [c00f3d40] handle_irq_event_percpu+0x80/0x110
>   [e5ee9f40] [c00f3e48] handle_irq_event+0x78/0xd0
>   [e5ee9f60] [c00fcfec] handle_fasteoi_irq+0x19c/0x370
>   [e5ee9fa0] [c00f1d84] generic_handle_irq+0x54/0x80
>   [e5ee9fc0] [c0006b54] __do_irq+0x64/0x200
>   [e5ee9ff0] [c0007958] __do_IRQ+0xe8/0x1c0
>   [c812dd50] [e3eaab20] 0xe3eaab20
>   [c812dd90] [c0007a4c] do_IRQ+0x1c/0x30
>   [c812dda0] [c0000c04] ExternalInput+0x144/0x160
>   --- interrupt: 500 at arch_cpu_idle+0x34/0x60
>   NIP:  c000b684 LR: c000b684 CTR: c0019688
>   REGS: c812ddb0 TRAP: 0500   Tainted: G    B              (5.16.0-rc8)
>   MSR:  00029002 <CE,EE,ME>  CR: 22000488  XER: 20000000
>=20
>   GPR00: c10ef7fc c812de90 c80ff200 c2394718 00000001 00000001 c10e3f90 0=
0000003
>   GPR08: 00000000 c0019688 c2394718 fc7d625b 22000484 00000000 21e17000 c=
208228c
>   GPR16: e3e99284 00000000 ffffffff c2390000 c001bac0 c2082288 c812df60 c=
001ba60
>   GPR24: c23949c0 00000018 00080000 00000004 c80ff200 00000002 c2348ee4 c=
2394718
>   NIP [c000b684] arch_cpu_idle+0x34/0x60
>   LR [c000b684] arch_cpu_idle+0x34/0x60
>   --- interrupt: 500
>   [c812de90] [c10e3f90] rcu_eqs_enter.isra.60+0xc0/0x110 (unreliable)
>   [c812deb0] [c10ef7fc] default_idle_call+0xbc/0x230
>   [c812dee0] [c00af0e8] do_idle+0x1c8/0x200
>   [c812df10] [c00af3c0] cpu_startup_entry+0x20/0x30
>   [c812df20] [c001e010] start_secondary+0x5d0/0xba0
>   [c812dff0] [c00028a0] __secondary_start+0x90/0xdc
>=20
> This happened because we would overrun the i2c->msgs array on the final
> interrupt for the I2C STOP. This didn't happen if the last message was a
> read because there is no interrupt in that case. Ensure that we only
> access the current message if we are not processing a I2C STOP
> condition.
>=20
> Fixes: 1538d82f4647 ("i2c: mpc: Interrupt driven transfer")
> Reported-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to for-current, thanks!


--/JNsJdIKddWpXUvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW8lcACgkQFA3kzBSg
KbZI1RAAtAxtz3HaWUcwPjkaJUoIoFIOImetynn7oGfWyVLlxeWDnvfvrj+i6nTW
vTnplfVPhplqSzsQvRVuRJrrGsgeSrMLBTFdtQZEG5b6CaYMOuCdvwoCGOxXZMxR
dnFySLFH4evLGd9zQAOT0uP69hZ1vmvu7ZoYIVuq8cm+8Q98IgWRfmudSnDSkoB/
1TBGkesCVqe37uOn9jk7FCF85ZEp9K5bVqhYyjGiZindn45A45lmdkvmPWiWlmxN
GCZBPOBwAjKLMdS41WvAYVxcfbo2mEqZpRnhuSkvAc6PKNYAMHVBe2oDou7NLaKE
UHXkBdjlSXO4rwovFMm8L/BWp6Rmqz/UKvdON6Oj4yiHmGE6HryZ7AhRf8Mh/c5K
vbQxyUJ3iu7rW3OA+EMxM2fXq8P7QtMJcb/otPU/woD/2OeqRUqvkZ9YJ8k81ipc
qeqaBoArNYsFdw7YhNBwoNyge65I99M3qiL/G23dtnoZ9YJdYlLu5CMxtTdWRKsp
y9EC1KH4kbTsNYxirmDrvJCLU12Ljl+eqsV5VsQKo9GcVwGSYjVV9WUibX5gcaNH
2Fnb9zgbkVLwFmh2U+vT29RyKzze1qp6llXXkna5QAlFotD8l2EGuWL52phlZclg
6EF68jg0IDqJLUdT7IJcXBnUj3lyqsDMXMpvsXF+N3vLYrHW7pM=
=6n2h
-----END PGP SIGNATURE-----

--/JNsJdIKddWpXUvk--
