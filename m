Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927B973FB4B
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 13:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjF0Loj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 07:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjF0Loi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 07:44:38 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722DC102
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 04:44:33 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 22F3C1F898;
        Tue, 27 Jun 2023 11:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687866272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o7+iZ1pd+V8WVvAX+4St9QqO/Xf0f+YWaokPPyWguE4=;
        b=hzXA/F13WGsOjwUgHqxua2fl8L3T58hVU2OB8+TsFJKnx/KnAx43gJio3ryKcH4wSctwHO
        L3WCDFeiND7mrDahaF5gMmmb4PQUzCAcoJ47MWyfJG38r5sNWq07Fhe2vY10uS+aVy88nd
        WJCNlnYhwk+MltfAIyqImouu8bRRiaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687866272;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o7+iZ1pd+V8WVvAX+4St9QqO/Xf0f+YWaokPPyWguE4=;
        b=P08q1KyuWFllbzh/aHOlcnMM1q6+4Jnel1KpN1CQ6WEis44rATnGNJGSma+6FW2CkUDMcE
        8dyeYD1rXIJJwPAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2FAF13462;
        Tue, 27 Jun 2023 11:44:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 7eq5NZ/LmmS4LQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 27 Jun 2023 11:44:31 +0000
Date:   Tue, 27 Jun 2023 13:44:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        Javier Martinez Canillas <javierm@redhat.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Update documentation to use .probe() again
Message-ID: <20230627134429.50e2ab52@endymion.delvare>
In-Reply-To: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
References: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
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

On Tue, 27 Jun 2023 08:45:22 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> parameter") .probe() is the recommended callback to implement (again).
> Reflect this in the documentation and don't mention .probe_new() any
> more.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> changes since (implicit) v1 sent a moment ago:
>=20
>  - Fix whitespace. My editor seems to be configured to expand tabs to
>    spaces in rst files, but that's inconsitent with the tab style used
>    in that file.
>=20
> Best regards
> Uwe
>=20
>  Documentation/i2c/writing-clients.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/wr=
iting-clients.rst
> index b7d3ae7458f8..41ddc10f1ac7 100644
> --- a/Documentation/i2c/writing-clients.rst
> +++ b/Documentation/i2c/writing-clients.rst
> @@ -46,7 +46,7 @@ driver model device node, and its I2C address.
>  	},
> =20
>  	.id_table	=3D foo_idtable,
> -	.probe_new	=3D foo_probe,
> +	.probe		=3D foo_probe,
>  	.remove		=3D foo_remove,
>  	/* if device autodetection is needed: */
>  	.class		=3D I2C_CLASS_SOMETHING,
>=20
> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
