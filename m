Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEDE64C6F8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 11:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbiLNKUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 05:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237645AbiLNKUm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 05:20:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E9414D1F;
        Wed, 14 Dec 2022 02:20:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DF4AB8172C;
        Wed, 14 Dec 2022 10:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064DBC433D2;
        Wed, 14 Dec 2022 10:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671013239;
        bh=cMUFvzdF/SdFZnd5UFrx0zQ0EoQivvDMwDvS/2E4Vfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aycZdjMsq7XiJNYlhdvzvOaElYtQU7bIytNisyHKHfUxu0s1dVhrLdWyLf7ZhFv5a
         a7Z0aa3boxhHmpcjQNvkK1hFDKBRPv8W2P2t0AKpLWov4dMR7X+ecxkElUmcte9cP6
         CUXsrHaIbCBRicyXJGIHXgKxKQAlikqD8noilUp3y+3h5oBlUJf0Xk/3JYOmn8MALL
         qWiUV+CHmlZBQ5ieorMW2t4BtPF+/Im4LvOLEgomuyVc9QsD8Jexkxkyd568L1uvf/
         Bs4AFAZtsgYoi2zVL81B/UaDgNL/d4zmJPyNHnppEIg1rjCDHG7lZL/OlORuRX3LlB
         tTGYdctBN7POw==
Date:   Wed, 14 Dec 2022 11:20:34 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     mst@redhat.com, asowang@redhat.com,
        Conghui <conghui.chen@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Jian Jun Chen <jian.jun.chen@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <Y5mjcuCRP45ynJis@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, mst@redhat.com,
        asowang@redhat.com, Conghui <conghui.chen@intel.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Jian Jun Chen <jian.jun.chen@intel.com>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063107.fazrfq3n26hw4ndl@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OI2D2tNcAW6qK5VE"
Content-Disposition: inline
In-Reply-To: <20221214063107.fazrfq3n26hw4ndl@vireshk-i7>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OI2D2tNcAW6qK5VE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

> I understand that it is okay to pass the maintainership, within the
> company, for platform specific parts from one person to another, since
> they have the best knowledge of the code and are the only one
> interested in maintaining it too.
>=20
> But what is the rule for generic drivers like this one ?

Dunno if this is really a rule, but if a maintainer steps out and makes
sure there is someone to pick up the work, this is more than welcome.
Way better than a stale entry in the MAINTAINERS file.

I mean, it does not limit the chance to have further maintainers, for
example. I believe in meritocracy here. Those who do and collaborate,
shall get responsibility. If not, then not. We can fix this, too, if
needed.

What is the reason for your question?

All the best,

   Wolfram


--OI2D2tNcAW6qK5VE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOZo24ACgkQFA3kzBSg
KbbM9A/3bFT2aF50TuVky2pvvulpZ2yDFxu64+b00PQNkjwC6+PWUVJp+k05OjfP
BgL7cPHl+1p8+VEVLSJcMXtYTToCOaOV2UTm2f+M4MUoI/DgzWhyouz+3LBFrQJh
6eu2zAU1VO+FYMhILSzeqpck+6L6k1vZDq5sLa/Kz+jiFbVbvZsj0Y747Bj2L/Ul
G1ysStKXSuhOvbgTthC1j36D1uy4DA5+PPXadbRhIcsI9N2REwZW/XgmrTmeFJJi
qWV0scCxeCX5iF5vCD/IgmmFUGbKDUZltIK2KS9d3dI2ZXqsBkzxRTEWzbRaNUt6
tO9YOHypb5majOsoMSPuflKDFTxexXpSasxm3f9flUBGTorxe4+Vis2UvZ1mNyWj
xEFQkBVPSi5tYWeUG2NGSEi3vLNaTBkJB6L5Hhf01pHtda4FLdrDTGYM3MEjG9oP
4AAk7/nLmyP3l1Mjqh5mC5n6IxRh5jtpsXZrQRvwK/lPxu4JZbbPGGMMcOyaEAzq
9IF1MuJI9o8jIR3+m+O9Ry8/vR+DjN5GgvIa9U0XBMvxbVI8NEjs/2Kebd5WCqNf
YPDimxB3KkauPe6MxjAfDwmlQMNrKlf73PWXqVxvNd2d4r92HXXAFCShN5hEYjrB
TY1OdBN/AjWTJnRWU9BrCBwUlfrUV3/MdSB0sv3Y7qk0nPQuWw==
=uuEC
-----END PGP SIGNATURE-----

--OI2D2tNcAW6qK5VE--
