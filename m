Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A337A5F52
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 12:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjISKUM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 06:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjISKUL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 06:20:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7110F5;
        Tue, 19 Sep 2023 03:20:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928FBC433C8;
        Tue, 19 Sep 2023 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695118803;
        bh=vVqBizXlIr57susmkCRr/3LQlvrykLiMDIwyT0LtmDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s/kHgsZQ7y3PwnFZvHrG8Pc5mH0FGR12eIoIfRIOaE+A8mHNg7q4s9b9klbTsVLxN
         7G+f/hKoL+uqUa2loh4cRIpYIEPdJWeIU6VM2ppDlXtW9AvdJ4HctIEZjRSExWOoh+
         bW1QdMm2Jw1RJG3fNUWVB0QUUwpHp6ClChAVH5BOSmShG/FI3f2/+YYLI1HpxTT130
         gPVXKDtnSMCodOWZHswIXm3s41kGfDjUHcn7BztGvgGOiw7CaPJY+ISiyOP6ylgHpL
         ZgmgrmiZJikvm234V0z+x6KaTlpCzEzUCLquAcV2kdinSPO05rk6S6d/ecaUwqEE3V
         atZxUyUut0MBw==
Date:   Tue, 19 Sep 2023 12:19:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZQl1zwVkx9n2MPvr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>, Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cO6/IsiqUl9vEhfN"
Content-Disposition: inline
In-Reply-To: <ZQlwC9TCSwWJpuxy@arm.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cO6/IsiqUl9vEhfN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I also agree that a wmb() in the i2c driver is not the more elegant fix.
> For similar reasons, we hid barriers in the write*() macros, drivers
> need to stay architecture-agnostic as much as possible.

Exactly my thinking. I wanted to read this patch discussion later this
week. But from glimpsing at it so far, I already wondered why there
isn't a memory barrier in the final accessor to the register.


--cO6/IsiqUl9vEhfN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJdcsACgkQFA3kzBSg
KbZ34xAApSejksqgrOmtvdFYNIlyfKQ/dmCvH5upVR9s2uBzYf4OW2DfKk9V2pQs
Z6ZXZnao8LkOH2+qpxkFYz7glDSYOQAEIp7r+bcHvvXRQp5JaJc0a+5riq0WXNmP
yPlF86yrTb9Lkv5NqCxGU6O8sxsnSvGecjC/Ej6TiU7iNCdsamrbHUkYAcPpmNaW
xg1Ei+fI5rSbz1Ty6cVVZ33rjqN5rpssISVvHwTZ/1pOJiEJYnFA/i8ZhDboAeWJ
DKR3XvELgGx3W73Np/HfR2qZb43Iz25guH98/2r4GwH3hIVdLDfq92f+hkm1hziT
FSoqgVL8XATHf52FTC8wJODqxpJnOafd+BBV7sazQ9xQR1BX0GWIGSdE/gCLsrfl
wpQhN2OOWuWwiE8eZK9azgnZqxDtg1RjNpiCNNI4fft/XT0LuWLp5AW+M6bG1k85
AW5jMrjuXuLyNeLH+B8NBBsxz0mDgy0hBs+ZKMdICSl+fVQfjT753qEPoJQbLKLH
Qc+PaFiH/T0PXKISwv1R9eshHmLeZDmCzDVjoDzJMQzk7XSqcn07wQnWmeE2yMMh
AnLFfNfL4qhw6+15dEVIFQqfu5MIDGvAqCMuP7iZ6hi+CWiGkBflCXFEi9WAvrPY
h/u69r7U3sNViIfNcigbiLR6GGDTs1Mmn27gfxvRaYrmkpxBiIw=
=X2+z
-----END PGP SIGNATURE-----

--cO6/IsiqUl9vEhfN--
