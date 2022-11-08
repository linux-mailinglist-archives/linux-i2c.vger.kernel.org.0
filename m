Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC47620DB4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Nov 2022 11:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbiKHKtg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Nov 2022 05:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbiKHKs6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Nov 2022 05:48:58 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3EC101FF;
        Tue,  8 Nov 2022 02:48:54 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7BE911F88B;
        Tue,  8 Nov 2022 10:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1667904533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zSI2NTbS+XdsimuqF+drbRNdrmDPUdPcKKkDDnTK4+4=;
        b=fl97OFHmDEqv9FfvncX8vUr17T2NnGUpng/euvxXI7gRYUNN7xR8C2W3uAmUQT0VMZOII2
        Jey0hR5ZteFUEjkoMPmHMZP0AOidLtDRXUgMmvonpcLOUhxfhukdm6A6CbcEB299gb8wy1
        jDhApY1kZCf9VK/q++2/PGsWXN057CY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1667904533;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zSI2NTbS+XdsimuqF+drbRNdrmDPUdPcKKkDDnTK4+4=;
        b=WslxQq9BmflLTOGSUBFqnZzftqqOha2WlhXNYXKV83g0tBUM3TAh64dY5VUHm06PNxIhxF
        PJpm9ov6pOJPDPCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F8AD139F1;
        Tue,  8 Nov 2022 10:48:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FL/JERU0amP8IgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Nov 2022 10:48:53 +0000
Date:   Tue, 8 Nov 2022 11:48:51 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: support new RAM variant for SPD
Message-ID: <20221108114851.4436c3cb@endymion.delvare>
In-Reply-To: <20221107160602.1912225-1-clabbe@baylibre.com>
References: <20221107160602.1912225-1-clabbe@baylibre.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Corentin,

On Mon,  7 Nov 2022 16:06:02 +0000, Corentin Labbe wrote:
> On my x05 laptop I got:
> Memory type 0x12 not supported yet, not instantiating SPD


Oh, that one must be old.

> Adding the 0x12 case lead to a successful instantiated SPD AT24 EEPROM.
> i801_smbus 0000:00:1f.3: SMBus using polling
> i2c i2c-6: 2/2 memory slots populated (from DMI)
> at24 6-0050: 256 byte spd EEPROM, read-only
> i2c i2c-6: Successfully instantiated SPD at 0x50
> at24 6-0051: 256 byte spd EEPROM, read-only
> i2c i2c-6: Successfully instantiated SPD at 0x51
>=20
> And then, I decoded it successfully via decode-dimms.
>=20
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> The result of decode-dimms could be found at http://kernel.montjoie.ovh/z=
oo/x05/decode-dimms.txt
> Since RAM is DDR, I wanted to add '/* DDR */' comment, but I didnt find a=
ny document with
> proof that this 0x12 is for DDR.

It is. The document you are looking for is:
https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.6.0.=
pdf

and specifically section 7.18.2 (Memory Device =E2=80=94 Type), table 78
(Memory Device: Type).

>=20
>  drivers/i2c/i2c-smbus.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 07c92c8495a3..6dca19c994db 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -362,6 +362,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
>  	}
> =20
>  	switch (common_mem_type) {
> +	case 0x12:
>  	case 0x13:	/* DDR2 */
>  	case 0x18:	/* DDR3 */
>  	case 0x1C:	/* LPDDR2 */

Please also add LPDDR (0x1B) for consistency.

Thanks,
--=20
Jean Delvare
SUSE L3 Support
