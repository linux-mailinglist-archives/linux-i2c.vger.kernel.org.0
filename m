Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8013560A89
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 21:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiF2Top (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 15:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiF2Too (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 15:44:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019E1255B4;
        Wed, 29 Jun 2022 12:44:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0C1EB826BA;
        Wed, 29 Jun 2022 19:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BB8C34114;
        Wed, 29 Jun 2022 19:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656531881;
        bh=zcGOsPeA4W/M19Cgq+IwJ/rAzjsEafamsLVcy7I5yLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPWGo7pLf0mgj/MNOxCOX27vIibuw8MAfmAJGIPv9XA9WtnMF6wC5ApvhPADMtQIT
         q6tiqC2dOi7OySO8mwFMx0iHgrAggfdzVxRCeAdaNutMWVbj7oiMveT/d9rkvhrkw1
         1Ll7kkDmOwtrK3BMYVa+1jNisHMsVVult2XM9mj1T8XWwHu4EiMrVRCzbKSMl3JR6S
         XuUF3eznTOr6zK6XyPE5dI0nRHESP6AEQl11at1U9hddcXNTnXFbIbRba+rG9y+bsq
         pens3xirkM/Vq9F2yCQ/qHSMxXKCqHa0wZ6scAPpA6r30VkWa8tccw5w14QmasyBe9
         QWrhyxI4DqVvQ==
Date:   Wed, 29 Jun 2022 21:44:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Alain Volmat <alain.volmat@foss.st.com>, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 1/4] dt-bindings: i2c: st,stm32-i2c: don't mandate a
 reset line
Message-ID: <YryrpbBKsAKcL865@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-2-alain.volmat@foss.st.com>
 <20220628134115.GA345270-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ekIVSbt5ZRWqdhEl"
Content-Disposition: inline
In-Reply-To: <20220628134115.GA345270-robh@kernel.org>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ekIVSbt5ZRWqdhEl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 07:41:15AM -0600, Rob Herring wrote:
> On Mon, Jun 20, 2022 at 12:54:02PM +0200, Alain Volmat wrote:
> > Update the dt-bindings of the i2c-stm32 drivers to avoid the
> > needs for a reset property in the device-tree.
>=20
> That is clear from the diff, but why. Some chips don't have a reset?=20
> If so, this should be combined with patch 2 as part of changes needed=20
> for a new version.

What do you mean? Patches 1+2 should be squashed together? I can do this
when applying. Or do you mean something else?

>=20
> >=20
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > index dccbb18b6dc0..8879144fbbfb 100644
> > --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > @@ -94,7 +94,6 @@ required:
> >    - compatible
> >    - reg
> >    - interrupts
> > -  - resets
> >    - clocks
> > =20
> >  unevaluatedProperties: false
> > --=20
> > 2.25.1
> >=20
> >=20

--ekIVSbt5ZRWqdhEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK8q6QACgkQFA3kzBSg
Kba/dw/9HiqC7hJIBjmzkeSy2RQELIZxZbWbGpNm2r2PFwEhYqgVfFYAXgAm+YB7
zXYq6y1hi+DdkIInEftxL6y32UoEJ5Lh4BKBgPskMOyb/3/sdtZAc/FGUMBAhOXy
pgtnuoYhDYTXL9ztsyzzML1pfm/tjgQPItYdByQWFOYpDh5mIQeGrwbFZhSfoQRQ
Jo9MKsOdRr0OoGpmP4001aIjWRzU8v8tqqKi+C5JyBqQFZH8bvNg8j8CDZro+hCk
8M4g4ri23oxozlJ4ZUiWga9U5uBuVThfAlbHuT8nnvZQWJYhpNHjFiG3W+Qt1JiF
DeEEPKEA8fvbMdK5Wv0dSDbMBdAYvabiTVmLzPolcEiHcHkdMMfxLc6QVnmKD1l+
g392htFKjRQgMbzDWnDbuELiIVksqhyGeJZAvYqO2igbvncsrGNCs/sVu7vg5Mrk
ySfMvobGm1RRbcz8CUVFd6Xmb+C4EOHY6WzVW6bPlkoiJZzm602C8a0lODXg03YG
gYZH4odaoPbYaOrC56DriIxtZpSsr6+LHns6GQyU0B+RlPnYd0X5VQOiXI7Z6MSd
I3DXom1RV0uUiK8jpy0Upiv/PnEk/soU4mc1SNypY9BLnP1Oy78mhxpPuzVF8Sso
xGgKBPJYlJKKo72hqTwyOvIPEjfMgAmxUiy6o8izpq2WIvG9Tvc=
=aKQP
-----END PGP SIGNATURE-----

--ekIVSbt5ZRWqdhEl--
