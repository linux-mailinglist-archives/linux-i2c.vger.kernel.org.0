Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 893766FC47D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 13:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbjEILE2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 07:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235402AbjEILEO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 07:04:14 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25568213F
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 04:04:13 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CE6E71F45A;
        Tue,  9 May 2023 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683630251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=71SpCN3yoAeDGZ2oEaqftjjC65raK3VrxYZiQaUnqFs=;
        b=GzK1vApbQffZrmlzHHKRuDWr8pIhxRIE07w/5LFVHQggSY2eZ8n9c+wYiencmAchCRPcud
        403AL7i9yZHiQWH6ChiXCHO/5xSt00Mj8/ZKy+2F3nuIqBJMHvf4AMtIUc6tIMHehGmbfA
        VSDYGoaRLSAqBkzVUMiq4jnVq5N/MJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683630251;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=71SpCN3yoAeDGZ2oEaqftjjC65raK3VrxYZiQaUnqFs=;
        b=QvhrPXwI8CD/2vBYpusZ0rd/vR5xWrDiUUr/QVOiP748It5Rrm9IKYgC3ukc67+7UmAwN6
        j/abEg0GJBIItgCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A150B13581;
        Tue,  9 May 2023 11:04:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id cM3VJasoWmTjGgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 09 May 2023 11:04:11 +0000
Date:   Tue, 9 May 2023 13:04:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 32/89] i2c: isch: Convert to platform remove callback
 returning void
Message-ID: <20230509130410.033d6dbd@endymion.delvare>
In-Reply-To: <20230508205306.1474415-33-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
        <20230508205306.1474415-33-u.kleine-koenig@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 May 2023 22:52:09 +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-isch.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
> index 2dc7ada06ac5..1dc1ceaa4443 100644
> --- a/drivers/i2c/busses/i2c-isch.c
> +++ b/drivers/i2c/busses/i2c-isch.c
> @@ -286,14 +286,12 @@ static int smbus_sch_probe(struct platform_device *=
dev)
>  	return retval;
>  }
> =20
> -static int smbus_sch_remove(struct platform_device *pdev)
> +static void smbus_sch_remove(struct platform_device *pdev)
>  {
>  	if (sch_smba) {
>  		i2c_del_adapter(&sch_adapter);
>  		sch_smba =3D 0;
>  	}
> -
> -	return 0;
>  }
> =20
>  static struct platform_driver smbus_sch_driver =3D {
> @@ -301,7 +299,7 @@ static struct platform_driver smbus_sch_driver =3D {
>  		.name =3D "isch_smbus",
>  	},
>  	.probe		=3D smbus_sch_probe,
> -	.remove		=3D smbus_sch_remove,
> +	.remove_new	=3D smbus_sch_remove,
>  };
> =20
>  module_platform_driver(smbus_sch_driver);

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
