Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD96D72260A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 14:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbjFEMh2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 08:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbjFEMhK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 08:37:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CA1E5B;
        Mon,  5 Jun 2023 05:36:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45F596237E;
        Mon,  5 Jun 2023 12:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10726C433EF;
        Mon,  5 Jun 2023 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685968607;
        bh=teQUjGZtfjVuU07nIIhw4FwYt29hiTTBU2/oP9YRE2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FfS0+I9kJf+nDTDeKBHwcy560tXeC+/u//yrrBaLbn1sdoPCuq8QIVKWf8Dmsq0Y3
         IUfJWWWdeaOMstB04954t8Ukw/d3kcxeqhFcrvdNMQ7eM+Bqqke4/eCAUH2us3O/iU
         pCA4oNVRDEa0354FjHnfeql2iEXHBDgKf0bYRjxG3lcvx2zWsM/9eX1Yc6jPgakC7h
         xo1Mxs1tBHySgxVp6xoDXPSNeCZ+IHxolkvLGtL0Br5NOCdTPbdGk1aN05zOmpAd7F
         oq20y9xUiBLTEGGgJuwGmTsI8HYojcATdccgZ0gBcLjTCRMN6+CdWLGPvNsBNH5Z5R
         cqnyjW9PY9ibw==
Date:   Mon, 5 Jun 2023 14:36:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     David Zheng <david.zheng@intel.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
Subject: Re: [PATCH v3] i2c: designware: fix idx_write_cnt in read loop
Message-ID: <ZH3W3M4gJn98gePX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        David Zheng <david.zheng@intel.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
References: <ZG5UI7cJvmLXvtLg@davidzhe-DESK>
 <f9a38ff8-ca08-a9aa-e2ff-ce2ce956235a@linux.intel.com>
 <ZH2yr1sFvjbAiBTq@shikoro>
 <ed2cbf76-1868-9153-81c7-cc17b807421e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="78D6NSPZ09ZAWJkM"
Content-Disposition: inline
In-Reply-To: <ed2cbf76-1868-9153-81c7-cc17b807421e@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--78D6NSPZ09ZAWJkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> In my opinion this patch is more improvement rather than a regression fix.

Okay, then, thanks!


--78D6NSPZ09ZAWJkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR91tgACgkQFA3kzBSg
KbYmcw/5AdT2wgEer4lfqBbsrbIyxfdNZTX6l7hvJlju25Pm/j/Icf+XiKBIf8zh
fj8hrAM8jB/8guijQU/fZH+jT/VFp2VVU8zZPGVd0Kf8w1ibuKVDdFYhx05KpswJ
+k5sHfS5gxnOLfYTLkM4sjfzr3Ed7tBjPV5UpVR+ZlWyUgmpX2CNzP9Ntl91gk+n
Dh6NrItj9IA6YtAOE7lebhLc01eeo3whzoJKa+7HL7kNFhgh0GF3Hv41OLqg1LcH
ZWRcTjFS2dJ6UZZhlVy2ABnLzn3Frxr3JeTHWAONevrGV6LOaY0OrNnIKzti0NJq
KrPWQjBfrOtBDKfN9V6OkgZUlX0I6lD2awrsviGXmAwSrSjorMDXpder/cJcC/c0
/4qD+LGzHiPQkPoK23E2/aj+YIiTlVTj5ObgS9sriIIiqPLRe0gsFbqkW1t0qqoB
uDUEdyQ6e3jLPdKTBa3IgTb+zoYURfLhSH04OMc9vNKJDZfN+3x11g9gNcEGBQ1Z
GhqTT1yhD9AxJ6I3juIS+21gk3Cb1zaMFGsQPW401FjQYfVb5LFtflpWBcTo+/sx
t61QwAnt2bq8uV2DIl7Ri31T7wQdiKGPKLzI/lLF9/e8t5JYqp2t/843d34Ukmgb
PEIODMzfEftgl7lYANeI7E4ZktLu5PjrjDIAgTqzQ3GJNGZyHw8=
=Gahp
-----END PGP SIGNATURE-----

--78D6NSPZ09ZAWJkM--
