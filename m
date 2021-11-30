Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183A7462F97
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 10:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbhK3JbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 04:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234531AbhK3JbW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 04:31:22 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3746DC061574;
        Tue, 30 Nov 2021 01:28:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 82C50CE1804;
        Tue, 30 Nov 2021 09:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD1FC53FC1;
        Tue, 30 Nov 2021 09:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638264479;
        bh=FBNdYA1ekU53UM+Z0zPdQkztZh3+oVIjQExU995I4U0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F/+xvE5e3mwgPcAj7zf6VIhC3JBjW1Rq5+6VSxyemD685G7UunQA2xXm1zgadMEi0
         Nb4/qRNPawnQ9EqxPSumxqwHjJprQorFW0IX9uD3loea6ch5ZFMii2X4f26e+VuZki
         d1CGi8QZ3bM71zmcuxGgGI2aPS3FK62/upnUqva4Jp8sAxCCUr7QLqIVDXIaBP58aQ
         0EZepIsiq4W2ap4iCLodE75n4CzwaEVObVOhf7vlk+TZxvGt5ZfjenmQmHT1kwr/jv
         7iZdTyoE+uA5wedcwDswxEzC/jY16Bmotg35WM1lVhAlN13pf7fp5Iw++DhJWlsoEw
         ln9OChBaqs10w==
Date:   Tue, 30 Nov 2021 10:27:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 3/4] i2c: stm32f7: stop dma transfer in case of NACK
Message-ID: <YaXunKuYf9S4/GOr@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-4-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TzOmG6v0i68yd2Fg"
Content-Disposition: inline
In-Reply-To: <1632151292-18503-4-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TzOmG6v0i68yd2Fg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:21:31PM +0200, Alain Volmat wrote:
> In case of receiving a NACK, the dma transfer should be stopped
> to avoid feeding data into the FIFO.
> Also ensure to properly return the proper error code and avoid
> waiting for the end of the dma completion in case of
> error happening during the transmission.
>=20
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!


--TzOmG6v0i68yd2Fg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl7pwACgkQFA3kzBSg
KbY/FQ//WnDVD0iswoT8WYcu/TTCEfsHGhSi5ELnU4DlZrmAPo6qxC8HE+62tdrh
g1GmaKJofEStWIpbNL/weh6siMp/01jHrA4H9Vws5NpG6W8/U5MF5XZNVbh1hBx1
wtUOI3NperjifGXhAUjJH9O4W0zPo3oCFqcq8MUBLZHQywYRCNnJZPwVrZAFcW/5
PgO46Jj6MHIfkt0V3tAvaI0heXLZbMa03ywQ/LmqxJ48+3rNGYidwKuqFiPdmfPG
JZ3AZDgfcRT5nAWvaORc5V7eqj/X6oBEBiLGLocGXexo7jg4LQAFwqYYA2o0Jtvq
s0NAsa9GjIV6BMo5Al1fVsN2u1RNzt1uPrxPbuG+oNk4h/cKcj+aqk8X7BN0EKfj
cOLiyJOAkNi/fSrIIfOTE7ZLGgROOTZxy+imEdJQT/L2b23iX4Eg7yX7/4+C8nwI
Ge9xtyEqOfL9VTn6P8vkkMjRDp/b8OTjT+4XinKuNJUh3gp1UIQk6Zc0ZKmurfNc
qBx1rWQqorTNGFFR7shHoJpXFWTUriEjKHlLVLqqYTruH/q5FV+WKGUNo17VoPRL
MPcRpPYFIzCw5WOJoYIVFG8KD6PIATfJNmgO59zdtcwyunq6GTozl7U0/OT/FThe
S/dB+z9qWmlcRr9c5NsQ5MGv6WScQAQMUDJx0KoAxjJGM+PpY50=
=43U7
-----END PGP SIGNATURE-----

--TzOmG6v0i68yd2Fg--
