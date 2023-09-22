Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6A5B7AAF60
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 12:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjIVKXY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 06:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbjIVKXX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 06:23:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F78194;
        Fri, 22 Sep 2023 03:23:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9183CC433C7;
        Fri, 22 Sep 2023 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695378197;
        bh=QeN4FgYx7ZiFI1AzuyGAmQeP984ZoTZNCyNQx39zkVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ipR1aIsHHUsj3R2LNnfJM2+G0CTC9vS7I9AYHjZjd9gwQd3bTFm36Aq1bLdExNPbu
         x42Spq3ph/SR5rdbjaeUpiKTl+bfrjX/ZHYW7JmItgJWHSV+sgjrBurUh72QcthJz6
         A08RgaxFLyFAeAsmJNqYoBOSd9sYdqJih3fG1o9xY1j4b0CsIossFEqSL8hnw7KNPA
         4X2G/T0fbt2WpWk0FwdtIQ6qNOyIgqRakLloqgvvWyh+4e0XNr7TQLxnhwUTjW3sWF
         xUjkc8/p6Eri7f6/FJFkMjL8pdvRvO9v2yPq7gbkYL1PVsk3bIsYFc2bnOjnmMNVdT
         2IsS7McNpst3A==
Date:   Fri, 22 Sep 2023 12:23:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: pca954x: Add custom properties
 for MAX7357/MAX7358
Message-ID: <ZQ1rESLe3o+DlLvh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230914113416.1285518-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N0SpySl3boI2Q0Wt"
Content-Disposition: inline
In-Reply-To: <20230914113416.1285518-1-naresh.solanki@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N0SpySl3boI2Q0Wt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 01:34:14PM +0200, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>=20
> Both chips have a configuration register to enable additional
> features. These features aren't enabled by default & its up to
> board designer to enable the same as it may have unexpected side effects.
>=20
> These should be validated for proper functioning & detection of devices
> in secondary bus as sometimes it can cause secondary bus being disabled.
>=20
> Add booleans for:
>  - maxim,isolate-stuck-channel
>  - maxim,send-flush-out-sequence
>  - maxim,preconnection-wiggle-test-enable

I am not sure this qualifies as HW description, to be honest.


--N0SpySl3boI2Q0Wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNaw4ACgkQFA3kzBSg
Kbb0XA/+KgcnxqmwTEZfX+GJzlNVdzKfaLG3MpxP26Vqwos4Mux7EpthFyQJExQ9
HwUbibYmg4vRl/Z+bd5Eje6SJvZcxymdcuvpIrbN0YnruZvSVe1EilA0amaL0imH
jyn5bRu57ki1Tr4mHNqPz4aiXZf6v8dokkCeHgCp++7aD+NcSzycBfZYp0W4f2Nn
RbJaCbpybcZmXT5ZXYFoeXm02eR98vSo2e2fiHpztFYBfpgxTHSPgbEa3aOiIuRt
3Zd/Xw5saRw1qRN+5GeCjUYWgELbQiG3PQTnnlp4QyLis+/p8ssRTbgJSkqe2Fwy
ekBnSOJx7p+O2AytfFPI074MlONRApJHZPPOsPY4N7CFsyvLUiZSAE30y28AiKdJ
cJIx2bNZS59/LvUfKNIMqZmfPh9rblp72jVWkJXyLvviR28O9erGDK3Y3bwXa4Gy
paCEWw+fQ/HPzwXoYaqyca7dKMDstSIIHAkJ+S7EZ8QwhRKGOapbGieEjovNJ6WW
cOtwS+p+uDgnGYVTEpfLdA3+BVKTs5ax7lhQDvmktzGxnm8qZxM7eOSoCOROMS0h
Jm3KXG1fvJ4BlnlwdTsQvVIjJj5YZZFhxR4cxvUcWePqWfwHYMYt+DhEhpt4Dx/s
9phCozRweq6uMf0nmuoTOa+zCvOE/gzMMegEU3IQNjSLyVQoSvQ=
=4kjT
-----END PGP SIGNATURE-----

--N0SpySl3boI2Q0Wt--
