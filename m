Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75A715F6AA9
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Oct 2022 17:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbiJFPdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Oct 2022 11:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiJFPdQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Oct 2022 11:33:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07243B2751;
        Thu,  6 Oct 2022 08:33:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6CF8B820E1;
        Thu,  6 Oct 2022 15:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2208C433D7;
        Thu,  6 Oct 2022 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665070393;
        bh=b5fz2Faps9g6VlZUHemqmOjeGlkHE/XuO+Ju+7K214A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dqylxaX+JXllTIj8yLEPkVZBqPOA8RVrx3AnU9xEinCebuNlOnMyggpT2Y80GCOKD
         jn8iiFVa+0tWfLJIarZ3gsc9/5t0tmhNFVpZDSmYTxEm3+VkTnm0l0SUpgjsEB63l2
         CggpubewSFAbm+eamVnZO4CyMN9gRy+UD59XmmVr4BYO4qxyiS9KmAjYRaSobvpfXz
         DnSX30IFKdyjSNgEeCssZktyaIUkNxCpFB7k0Lc+SXVgkoMAgW8m2BDe1NFSnP52GJ
         X4HbSOH8Yj7yBUvZLDbotfkDUcHGpOI7PFo5Ulpg6CEjrH0C7sa5mARjW+j67nRLWp
         XjHxO0UAdVaJw==
Date:   Thu, 6 Oct 2022 17:33:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Corey Minyard <minyard@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        thang@os.amperecomputing.com
Subject: Re: [PATCH v10 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <Yz71NjbmLZeRpmM2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        thang@os.amperecomputing.com
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
 <20221004093106.1653317-4-quan@os.amperecomputing.com>
 <Yz3VmWCqdolKg5sm@shikoro>
 <c8c774c5-b274-a6f9-303b-e84c50800b5c@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+SCqpgtCPKo+UDYP"
Content-Disposition: inline
In-Reply-To: <c8c774c5-b274-a6f9-303b-e84c50800b5c@os.amperecomputing.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+SCqpgtCPKo+UDYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thank you for your patience with me through many versions.

You are welcome. In the end, I think the update of the target interface
is an improvement, in deed. So, thank you for that!


--+SCqpgtCPKo+UDYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM+9TYACgkQFA3kzBSg
KbYACw/9E3V2Y6ViQwRZW439rY0GLtJGPos89UPLB3b8h2XUl/8KWQBrU4MDD46d
6VEho+Ae8+5OHpqczwMiXkgc+Z/Yc0OtfOUXCqEr339KH09Z2k930RdTb20dZf6t
UZbq+wAaD9xn4nXBMEBM3YoBDbncbhTEamK0mKkh5lHmD2fZqXXRqpbBtwSZXN5s
Y+Oshsl9cuGEkqde5gVhRR1DWJrOesWHmg51VhBvq0E74sSlWc3D4ByKYJ2K95qw
w0gd48NMY5vtSvM8e2X2SqA/1rwYYi91bn5xFCM0hSXWmAU+hKhEW6O0rQrbZPu1
9mwoOHEvTanaLpYiWCsnevEgEsLifpiKMlojSmQZIQLeFLTg69K36Gdyb57mNzD1
4+Mb5QP4yjHkjA9uwr03qJv08xDKmQtnQhO/dkjz0iAE3uxdpGYb3XB0chL+YI7p
rJV9CIETC+HFpzrKiOu9XGRNnLzu7dJ6Jx489UKzS+d2cofL+gZMTsAkeu1WXBEj
UY8cqIm1rxaOJgy8SBotNJssqRS7TGL/TYtXFgFtQIJ2pISQHB1Yc9FdZSRdXHLF
5wRpQZlTnIS9/wL/K29aAvePtLJHbDhUgaDIqU0JgNEdA1wA9wUj0RK0FrQyHBP0
W96sDicwz7oVBGNZuX1lQHtfYGZqdBPIllgG8XaGlwNlwgRCiyg=
=WHBN
-----END PGP SIGNATURE-----

--+SCqpgtCPKo+UDYP--
