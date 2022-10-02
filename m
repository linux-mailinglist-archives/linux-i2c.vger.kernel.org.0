Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93A65F207A
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJAWzL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJAWzK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:55:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDE13BC46;
        Sat,  1 Oct 2022 15:55:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B82E0B80880;
        Sat,  1 Oct 2022 22:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07AEC433D6;
        Sat,  1 Oct 2022 22:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664664906;
        bh=XXrUTnO/jGDvrU3xZMl4EIcYRbQHHkKeA6gIDbBw3ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YT/Ih2HpM9PZUXELCietG1opxKRPTU/fq3SfDqEG7oyuI+ujvcG64lrsq4Vjpkcjf
         sAz4X5c7Wn8u6VJFm5dqoqXdbLNIyWfrXTF4Mf05DHPZej4MWnEL/tIVrWDTz/K8zk
         lCbV4kqwGgL8mfpED1TqVKUNEDNfk9uv89KNpH8BKG1YFKBFqL1IiWKOA/I7y2tD/m
         gmCONOOBIy2RmoEJ9GRNdski5/c1Bc71NR/LGe53OPHVyCX11duNZ/OJmJqrpvu6cC
         JY6lgmXKu+MsxF0JbMf9XmeJAPySRFVlQaFfXrhNRTgFU5SQjGI1PTjAMJlspTH6xx
         jofzzx5igcGug==
Date:   Sun, 2 Oct 2022 00:55:02 +0200
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
Subject: Re: [PATCH v9 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <YzjFRrCRZBAaSRBL@shikoro>
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
References: <20220929080326.752907-1-quan@os.amperecomputing.com>
 <20220929080326.752907-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IxEzN7Ip5LYkgIP5"
Content-Disposition: inline
In-Reply-To: <20220929080326.752907-4-quan@os.amperecomputing.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IxEzN7Ip5LYkgIP5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		if (ret == -EBUSY)

Since we documented this:

"+  'ret': 0 if the backend is ready, otherwise some errno"

the code above should be '(ret < 0)'


--IxEzN7Ip5LYkgIP5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4xUYACgkQFA3kzBSg
KbZdkhAAqUK8dp016LtVTkYRjmSJrym+/WMeAvZxlaB6ZEcEyi3XNOWPIt3v02lQ
8zs6VMgNd4FwbNmdaRxmsc8kNZEYmUcY5oPhkugt/6QcEKYxcjaqEdn26Rd26Ro8
C01y93rYoDlPfBvAxxnsdnUtmyeKEz653skr5v7W3HGnUyEhq3CpQfBFVEmhb5dQ
HpCYACbDMG6Sq3g5PxJdRxAbFfogiWDBfuay86w7D1UYl2h8qG8c3IR/pn35xDPO
n33QwX3XoNCRceYOulMJ49ZSBI+Ikb4MgX00SKxhuUCdCpC8OGVHS7fcmUMnyIh8
9W2RDloFDGZIbnPtvB7XmpC3Pmzf3atkGvZxHNpw6KFJdxvBONObgkE7+lPLzO6h
I2I+vbdkFQeJ8b9xyncnaDH9Kil10BE/DPBRQd9H8Okh+YnzitNjcXNOCehZFU4z
aRaYJQh3VY5d+/vUqQU0xj35TF7IndzgiMM2HX/XxL08QqNmqpbb24ush/U/Sa26
WiPaBbDF8O1wCLEMqUjYpbRecP8vJNAWF3uzRUrBjXWVYgMerL2o9Q5MHChi0Ng1
/RBW/2VZPSJXSQrcGv9EBXKTbjEmkrkFRznjLj/IxPye53k4TnzOqqhyfhridGBC
VXc1UXhtbxn/ycsVNy3FU2JXf6np6S2f4Xso8uFyTUsshK5vtDI=
=e9CN
-----END PGP SIGNATURE-----

--IxEzN7Ip5LYkgIP5--
