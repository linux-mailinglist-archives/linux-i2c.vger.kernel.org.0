Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240D0629997
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 14:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbiKONGX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 08:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiKONGW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 08:06:22 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD64AE48;
        Tue, 15 Nov 2022 05:06:21 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8C0922228E;
        Tue, 15 Nov 2022 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1668517580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=abSDNB14ZREuprRrpVDZ2SfZLmE2c2CRnEBuVI2uoe0=;
        b=R8NwDXCErErXh325pGP86m7n9PjKzllyEg2/jc0O258QbhrV5Gadlve5fq0BfaRKKHYWTp
        m/FTj3gAPS9fDeuBrG9K8HQIfgGpOQp1rRZ/zGa9lhdvFKt+vqfj3gHdDtz50ZAeZQND2H
        0bj815krmYiM5qYVcJZghKh69gkXnMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1668517580;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=abSDNB14ZREuprRrpVDZ2SfZLmE2c2CRnEBuVI2uoe0=;
        b=2sLqZsZUnnA6rPPHj1v6EBn3e0c+7fa65/XpscbyIjdJ0eP1lWarvAryNS/Gn6jVzEP+fg
        /wENRt2KczvQ88DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F9CB13A91;
        Tue, 15 Nov 2022 13:06:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id TZO/FcyOc2OPWAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 15 Nov 2022 13:06:20 +0000
Date:   Tue, 15 Nov 2022 14:06:16 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: smbus: add DDR support for SPD
Message-ID: <20221115140616.555e8331@endymion.delvare>
In-Reply-To: <20221114115606.1967080-1-clabbe@baylibre.com>
References: <20221114115606.1967080-1-clabbe@baylibre.com>
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

On Mon, 14 Nov 2022 11:56:06 +0000, Corentin Labbe wrote:
> On my x05 laptop I got:
> Memory type 0x12 not supported yet, not instantiating SPD
>=20
> Adding the 0x12 case lead to a successful instantiated SPD AT24 EEPROM.
> i801_smbus 0000:00:1f.3: SMBus using polling
> i2c i2c-6: 2/2 memory slots populated (from DMI)
> at24 6-0050: 256 byte spd EEPROM, read-only
> i2c i2c-6: Successfully instantiated SPD at 0x50
> at24 6-0051: 256 byte spd EEPROM, read-only
>=20
> And then, I decoded it successfully via decode-dimms.
>=20
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Changes since v1:
> - Added memory type document link
> - Added case for LPDDR
>=20
>  drivers/i2c/i2c-smbus.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 07c92c8495a3..c85710ed9548 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -361,9 +361,15 @@ void i2c_register_spd(struct i2c_adapter *adap)
>  		return;
>  	}
> =20
> +	/*
> +	 * Memory types could be found at section 7.18.2 (Memory Device =E2=80=
=94 Type), table 78
> +	 * https://www.dmtf.org/sites/default/files/standards/documents/DSP0134=
_3.6.0.pdf
> +	 */
>  	switch (common_mem_type) {
> +	case 0x12:	/* DDR */
>  	case 0x13:	/* DDR2 */
>  	case 0x18:	/* DDR3 */
> +	case 0x1B:	/* LPDDR */
>  	case 0x1C:	/* LPDDR2 */
>  	case 0x1D:	/* LPDDR3 */
>  		name =3D "spd";

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
--=20
Jean Delvare
SUSE L3 Support
