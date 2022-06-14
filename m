Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EC654BAFF
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 21:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238477AbiFNT5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 15:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237013AbiFNT5Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 15:57:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406F436312
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 12:57:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1ADC60A50
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 19:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DB6C3411B;
        Tue, 14 Jun 2022 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655236635;
        bh=gNbO3DSHhTmgi3CuStnkanZIacWLd4++mnYRlUmPDWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tOQzyaDueoUjp0IaRBdA9w5G7vdG5jmiUpq9/uVMfYZxZOSvF31O23jMReboSrZq/
         AQcA6GyCWsWnItczGISROVU5y16vd0VS72diqdMB1WWIgXX/6W4Wmmz0dAs9OYsJtS
         63gfIhKMBOqSrEpWIhKusHtntF9xO7a/9fzsWQHs9rlTNSCCTKl1ZDIAfzz4mRuvBj
         IfLfJu5FWn+qPuVcQ4xuzN+bHeb/cLwHHRYPQSzITnZHV4NVW9JKvrFq3u4x2awIei
         AGfZdEe0QA9a7NFT/J78SKtZoEziqTkUO8qo0cGppB+E/d+Q09JQiSOATRMiPNMnoD
         AerLTXPy6kgow==
Date:   Tue, 14 Jun 2022 21:57:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: core DT include belongs to core
Message-ID: <YqjoF4SLu6X09Jh0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20220613144713.23501-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pUF1GQ4iKPcN9zaS"
Content-Disposition: inline
In-Reply-To: <20220613144713.23501-1-wsa@kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pUF1GQ4iKPcN9zaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 13, 2022 at 04:47:13PM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--pUF1GQ4iKPcN9zaS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo6BcACgkQFA3kzBSg
KbbWmA//S56D7BFOhWayF0v3NRyRC2ETITXT8dwbCxhn1MONgzxw3TTRSxcyi8jB
wmAikW4A3Xkb4VVWgrv67waCsXAfQWbFU5dKOBT1DX3zJA1wPO18VHXrGEsDLpNd
qcpd3/I9W8+PqgLfwqz/lt4Pkb7o0qpJru7C6WiuQZ1QFSu1MqeJUW1MVvHQWmz1
mQFeQsuprWo+ViC3I4nHgaegzGym6ERSSwe1FLp4u0wknZbf28f4zcmW6PUe4dVC
tuJ5tOYshgIEc7Ylve7YyX4vkH2ObTXmCWy4Y0rvrFCyAQLNT0Wim7o3o5x9MDWX
cYl3wWbrg8Up7aSsQKbYY+cU/h56OdiYL3VJ/WLzfndKnon4N5zsw+iomw6qibnr
pdRhQXMAwF8eiuNiQDXVta2NnPaxCVF94jZUObfJcxJN041+Ve6zaHH4h9LAyY/1
jUE+89dzK3LCIuqOYhbwdvSBRCWV6XnJtJOcnew9tD9H7YdPErLwKvbTkfFM0Hgm
jAaMfj8kb5PipCQvklsb6eWbtnRaTeL3FmZdy8iuHj0/Ec0HnJreXYoFNNi7cOEZ
zPqitPNiGfxYLFaBCS7oeyw8e0a+x/QWgLcU5dOoOKaceK+DN2qn3ax7LegvDLR4
0BXQU6DT+HVReFEw9O/7zslaHMoZ1f6J+s3QuTAtnhhdAEfYUas=
=yJpv
-----END PGP SIGNATURE-----

--pUF1GQ4iKPcN9zaS--
