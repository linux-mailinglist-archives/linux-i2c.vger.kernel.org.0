Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9246750A6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjATJVB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjATJVA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:21:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D48E966CA;
        Fri, 20 Jan 2023 01:20:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B690C61E52;
        Fri, 20 Jan 2023 09:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C435FC433D2;
        Fri, 20 Jan 2023 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674206456;
        bh=8YtcQpd8nHqXd+973881i712KyZxniPOL90+PIO7yEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPslklE8R0UMrCR8HRxvxN9YgbL0IeGdmwGT45RX0wKN8WWZhzMTFbR8a7hUpTXxm
         ggwDk8Ax1tCZ5EdbCfLY5TO8s3Gmk/ltiP8tyB8B9fVu7nqm6X1kX5MKAGvycKo1V1
         +e1jDMfXNV6ElS7jkIez1GYWWzZb6ZKeJGP5/qJjNmJ9q9P4hGrrrkh/jhu5W/GnE6
         mWgqnUKPeKOjFcRnz0RadIGpswmxZg32Fs8Qfpq7WJG+UQAhE13JNsZHx8XXfFSS1T
         CeGlugFV4gbPmrwogXRfVguayEYXgg/bR5L9tMtlf+OOEouGWPevzflSwFZ8EHZUi/
         pE4IOtLF0xHuA==
Date:   Fri, 20 Jan 2023 10:20:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: fix a bunch of kernel-doc warnings
Message-ID: <Y8pc9bhrqmpUn3v6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20230113063805.14457-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1mLmRMcLlcLNbu+v"
Content-Disposition: inline
In-Reply-To: <20230113063805.14457-1-rdunlap@infradead.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1mLmRMcLlcLNbu+v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 10:38:05PM -0800, Randy Dunlap wrote:
> Fix multiple W=3D1 kernel-doc warnings in i2c-rk3x.c:
>=20
> drivers/i2c/busses/i2c-rk3x.c:83: warning: missing initial short descript=
ion on line:
>  * struct i2c_spec_values:
> drivers/i2c/busses/i2c-rk3x.c:139: warning: missing initial short descrip=
tion on line:
>  * struct rk3x_i2c_calced_timings:
> drivers/i2c/busses/i2c-rk3x.c:162: warning: missing initial short descrip=
tion on line:
>  * struct rk3x_i2c_soc_data:
> drivers/i2c/busses/i2c-rk3x.c:242: warning: This comment starts with '/**=
', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc=
=2Erst
>  * Generate a START condition, which triggers a REG_INT_START interrupt.
> drivers/i2c/busses/i2c-rk3x.c:261: warning: This comment starts with '/**=
', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc=
=2Erst
>  * Generate a STOP condition, which triggers a REG_INT_STOP interrupt.
> drivers/i2c/busses/i2c-rk3x.c:304: warning: expecting prototype for Setup=
 a read according to i2c(). Prototype was for rk3x_i2c_prepare_read() inste=
ad
> drivers/i2c/busses/i2c-rk3x.c:335: warning: expecting prototype for Fill =
the transmit buffer with data from i2c(). Prototype was for rk3x_i2c_fill_t=
ransmit_buf() instead
> drivers/i2c/busses/i2c-rk3x.c:535: warning: This comment starts with '/**=
', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc=
=2Erst
>  * Get timing values of I2C specification
> drivers/i2c/busses/i2c-rk3x.c:552: warning: This comment starts with '/**=
', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc=
=2Erst
>  * Calculate divider values for desired SCL frequency
> drivers/i2c/busses/i2c-rk3x.c:713: warning: This comment starts with '/**=
', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc=
=2Erst
>  * Calculate timing values for desired SCL frequency
> drivers/i2c/busses/i2c-rk3x.c:963: warning: This comment starts with '/**=
', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc=
=2Erst
>  * Setup I2C registers for an I2C operation specified by msgs, num.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org

Applied to for-current, thanks!


--1mLmRMcLlcLNbu+v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKXPUACgkQFA3kzBSg
KbZZlg//UOAed1QTL3dLoSCkkvMRc1WMvTIzeC1OkEhJ0MZCp0/dt0f0pm1N5HFE
gRutbiIsWvT/9Tgl/QHE5GZFTtjayRO6QMGBkbZDh2EYTTNV/+zN5BfzgcVd4cZj
PY68lXO6pTp/2KEN7BqvHgTAnxffZwkT9/di8q8K9kTvRa7DHkTns5WYKNbLJY3H
c0cJL5uuGbJIKRFvDE6sBP+B1FvxJe9UTNlQYNuGMd92NanFFI+73+RwQl4jCWlk
CSuEbO7m5mmIjSaWkjBL2D4WCa/5d3YcIHCT41qfQ6hnaiqFn6+zC8AQRQM8TX/S
TNftvL054IGuCoMkUiGZdyaO0CwpEWwclp1r9pC38896I4W0MSlivAhFOvlCVszJ
cts3x85CH11XhicO3sT76nGsIv2nIMHbEINQmZ7aMWzrfcBYlJ/mLKR9nbKbDPC1
sZOxYq5xE4+g8ogFJpSAb97eT82LyIQpalRhL2NKFIr4LbuNPgrN/cfNp1nV6egh
WT6WwglfD5HdDKu9bH0gDVFEkRPDWUxyR+0UTeg+SfGO6ITV1C0QyODdRYV7si4U
7FAqVqB1TR7xv3xvs7YVvvYNysE2Bj0mCPm1yTu/vyDrLmGO8XfTGrAYvIJ1YT4Y
OXhvYoxfbjSxY8SrYFDX6JU9iux5Bx6y+OjMO1Jedgm8foD6qkU=
=EIvS
-----END PGP SIGNATURE-----

--1mLmRMcLlcLNbu+v--
