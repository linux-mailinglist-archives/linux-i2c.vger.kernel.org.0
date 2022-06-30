Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58CA156146F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 10:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbiF3IL0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 04:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbiF3IKe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 04:10:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38A342A38;
        Thu, 30 Jun 2022 01:09:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F20661DBD;
        Thu, 30 Jun 2022 08:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29881C34115;
        Thu, 30 Jun 2022 08:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656576555;
        bh=4oTlWkxVAMIWDl62630iJPW4grJUqfntfjQlLB+ZkwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LcbLDH8abfsYkL+KSdH/EKdGrADa5Y+T+9Yr0PwG9k80y5eyRSZOelEYMddtQuQ8z
         nax5NitsvscRmZEWa1pDAB6W1Ac1Pq60FFjiNiVQyUTGGFteGwgaj07P7aW1CSr4bs
         qcmCWlgjGbQP3T5tzmwO1Sf2o3hAtNf3jtw5ZOrX3dUi+vMEj09W61fddy9Ft1shQD
         bmI36/Ep4MBODiQAUrEC34cKVJPJ0Km5wYIImjhrV1o9kg1PEFLinGsC/IkIfrU/92
         rFeWnqL48nzOwOiMN4yrlvSEBiiqa56YSGih3sZgCuNugEp0Tbmj+vNEgRyDlRjub2
         dd3ElJUUdesCw==
Date:   Thu, 30 Jun 2022 10:09:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, andrew@sanpeople.com,
        mhoffman@lightlink.com, khali@linux-fr.org, peda@axentia.se,
        Claudiu Beznea <Claudiu.Beznea@microchip.com>,
        Cristian Birsan <Cristian.Birsan@microchip.com>
Subject: Re: [RESEND 0/3] i2c: at91: Fixes and updates
Message-ID: <Yr1aKJs5MYIINhlc@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, andrew@sanpeople.com,
        mhoffman@lightlink.com, khali@linux-fr.org, peda@axentia.se,
        Claudiu Beznea <Claudiu.Beznea@microchip.com>,
        Cristian Birsan <Cristian.Birsan@microchip.com>
References: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
 <YrysFU0fP7X1wkBd@shikoro>
 <176099e2-cbff-1987-f59a-2ca618a9c92a@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JKSchcY7C2IiYKYc"
Content-Disposition: inline
In-Reply-To: <176099e2-cbff-1987-f59a-2ca618a9c92a@microchip.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JKSchcY7C2IiYKYc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

> Codrin is not with Microchip anymore and we have to re-distribute the
> maintenance of this driver internally. His email address will probably
> "bounce" soon.

Ah, very unfortunate that we couldn't move this series forward
because of the mysterious mail problems.

All the best,

   Wolfram


--JKSchcY7C2IiYKYc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK9WicACgkQFA3kzBSg
KbYeBQ/+LdGfNG/Hx0HMxAksuZ20RbTm+2Ymoj0D7yLdwyyqETHPe8xQkgr8PtC2
xuwbSuvVwnfrtaNiFmOlcpy+igjasuE6NDLHo1LRU+0mSlqmNR02+dxFrY4Qjz3V
RjSjSFBmpl43TChvuNNqkzyA6d8ce0x7inEucap4G57G1l4tt13Hemv2hFrRC+Fx
PjlWVKiOASe53ISwG8luH68GwJtr2/D59wP4d+DE6YCWX6qDtLXf38OfwT/cZBHQ
DxoOnhPKcOlqWlATtZZG36kqE5Cf0q1ImXJPnvQSIvc83LQNSYbldBXV97LWIhMx
3v1xE4J8kY3FFdGIzRkwPgmA5gpaeO5CMD3ZQ8DhgMKmHdSYSWRrC6XWC610BaDJ
L4gfLnofsjpPyrKkGBFC/4FS5M2WXXSFYhapgH8UknU4bobGVjQhdAFdI+QtMapn
CjWTHRCtrtO/APDz4T6Eq7yeiQ9TDBdiAYhrQimQzqx1qMby/HjpK/r4zjabv2ga
10UDwfawCcsIAm+WvMcBEJYCafpmLZmFOuO3sJIRxpB0O5W+lQWcvjU26+bsS78G
j/9Ua2w0Ifow1Br9r6IeyA1u0XO01D0SXr9EDUw4Fwg2QuaEkqK6v1LA2tp4Bsk7
gIernz2iKlqnQe5P2k84l3BaNxQVyE+wadfoTr6sVZDPPXj6H1U=
=MNMK
-----END PGP SIGNATURE-----

--JKSchcY7C2IiYKYc--
