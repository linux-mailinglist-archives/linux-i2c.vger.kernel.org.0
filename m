Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BFA46249A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 23:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhK2WWg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 17:22:36 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:54876 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbhK2WVD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 17:21:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9185DCE13DE;
        Mon, 29 Nov 2021 22:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0530AC53FAD;
        Mon, 29 Nov 2021 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638224259;
        bh=7Y8o+kRb5lFcHI2kNBKy53IwhXDgTaXMAJ8OkS7EUEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uY6lyF9mGAcTnEtrCyivCMwlFOCqXRP3qwW3O/ZYrWrY/yYDvTVqJywZ0wygUL00T
         Nft23eBMx96EqLrvGk/0rK56eQI4kbtW1Ibg9+DSu+sLrWU0c+KQsSAO0cJ8XebUOv
         V6o19xLP6NcYV2BlzgUqQqE9pov/vsvvahH4FXsL1gnFpcElYFZoeie+I8HL8Utxwe
         +O39W2LuHglJqR1QBo8RFVuZbrFA85dekAczIvzQlHU9RHL0y5XjufTsHDb1NaDU4e
         vmDguIc8KMfUaCs3gNbxpxkRI1CkhVMPT0xfS+tya5FKI+Tv04efr6OE3n/NdDk+GA
         0JtqHyPwJSQXA==
Date:   Mon, 29 Nov 2021 23:17:36 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: qcom,i2c-qup: Convert txt to
 YAML schema
Message-ID: <YaVRgPDunBrc+Puc@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, phone-devel@vger.kernel.org
References: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
 <20210114180415.404418-2-angelogioacchino.delregno@somainline.org>
 <20210125221633.GA1112939@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BDbSGWnI4B1eLNfB"
Content-Disposition: inline
In-Reply-To: <20210125221633.GA1112939@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BDbSGWnI4B1eLNfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Mon, Jan 25, 2021 at 04:16:33PM -0600, Rob Herring wrote:
> On Thu, Jan 14, 2021 at 07:04:13PM +0100, AngeloGioacchino Del Regno wrot=
e:
> > Convert the qcom,i2c-qup binding to YAML schema.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@so=
mainline.org>

Do you plan to update this accordings to Rob's comments? It would be a
shame to let this go to waste...

Happy hacking,

   Wolfram


--BDbSGWnI4B1eLNfB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlUXwACgkQFA3kzBSg
KbYLfg/9HveOSnXAxjgb+hfTRR1qvUocHZaG/jTARuC6ombCNRLJMxKGMIhRFRHq
bVUYiwKNOAEH5zbI+arwsRAIYWhKHq3kLK1qdvqfNDY4pBs012BDLNN7WOdjRh6/
tACdFzdDx1WKQ5vVUfyFuuqI1pwuYqwjfeRl27RNOspD9JsHOgGXvvLhSfbGtLVD
ztvoA939YPzK6PX+Homi9hGKq9CnaxrMl87RDEso5blZ48FNZKtj3rIpktgmnxh6
vamZf8bhIuemZMz6dX0qVDL3As5BSulv70E4KjwkVw24VJxRiQRxn77aKJMyiTgQ
Db2sAacaldOl7tEslE8PwG9xqXq4QRFE69UxxlLMWhmuvi89Ngy043nF1EnxaYAy
lDcHBPN60ztIZv9P86RGx7VsF2oIgnMyrE413QNaVvA4SVARu6hvwmszdDMNurmE
j0UVAjh8okV6Y9q0PgKEd8ZjMbENMv1kdfvaZQb9ZW1oMogQ/YnOJPd2H40BbA/R
c+Gfm258ek3i7OUFOz6HMwuwvfPjeCauWGRvmH09P34Ws2/PHrUkLJpF3DjIM0K8
w+RHk75me4S+0Yek72bqtZ9Bh5oObVX+IyDdOvUaSpV6PZ+HtOL9sP2zlDkG2AY3
x1qKueAllzdznrkV0dgaxyyOQRLFV0pXgzoPGMMIZPP1x8IAlZw=
=s2FF
-----END PGP SIGNATURE-----

--BDbSGWnI4B1eLNfB--
