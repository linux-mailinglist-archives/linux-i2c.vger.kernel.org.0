Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B065F5A57
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 21:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbiJETGJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 15:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiJETGI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 15:06:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE7777571;
        Wed,  5 Oct 2022 12:06:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C0E16177A;
        Wed,  5 Oct 2022 19:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E786DC433D6;
        Wed,  5 Oct 2022 19:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996766;
        bh=qZOYdCT1aCe/JZjmiQhjcaPpLA57KvbcqFM3TGd0KYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qg03rLPpbYIdisynjImLpdYkJO/sEMunrsh0dpMnd0msNKM4q0kwSn9oYsEkYyuoX
         RsSS3sZyqYQJRRR1IrpPXdANdbfCfehXhdmGhrYuQO3LIkr5VNd8jT0d+EjGP+P2Ed
         GFpOL3ADwr16c/4Ad0PTCYiNsIu6SuZa5PNluanuFkHkI2ZZAhaLL07kMIDcjNhx33
         VTm/sxf0RICxP5JnMhRPjFNiYtbYWgVVykluIoecv2Dh7WEsFrF37e121miiJId13X
         QqPVEx5p/xT0sRv3o+iMP4DlRHIUgYvEatArxXRRPQ1TqCcTXJxfHqWsD3NHrxTj20
         b5B48nBs9QVvQ==
Date:   Wed, 5 Oct 2022 21:06:01 +0200
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
Message-ID: <Yz3VmWCqdolKg5sm@shikoro>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SJMSzPuygRaHqOAa"
Content-Disposition: inline
In-Reply-To: <20221004093106.1653317-4-quan@os.amperecomputing.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SJMSzPuygRaHqOAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2022 at 04:31:06PM +0700, Quan Nguyen wrote:
> On I2C_SLAVE_WRITE_REQUESTED event, Slave already ACK'ed on the address
> phase. But as the backend driver is busy and unable to process any
> request from Master, issue RxCmdLast for Slave to auto send NACK on
> next incoming byte.
>=20
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Applied to for-current, thanks!


--SJMSzPuygRaHqOAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM91ZkACgkQFA3kzBSg
KbYyDQ/9HuJtmUfec7mVOzYN9yOLKYOWOR5hIQd4A3+vP+K+7P1jObIubesRu2Xn
4OTZ9aEZMgumnmIWX7dGG9seW67U8FDCXjmRTVXZK1SLasgoL+0FRJbzfvLIqLUY
/dThu2R6w4xXOScan+snd98o5xj2gJIiRRUdNH0nNP7CioU5aWdxUykvqjoKYdzK
EVP2nDsPTfLp36vBt2+edcZpJFV2wXtPGhzV7hcypWURm7F7+Phao9vsWphXdPt2
aLZTFMNrjhkzE/M4PK4HVR11630Xan6D318KoJ3QcSWv0EAax+uxChijf03OYctM
sz2oXSExvYUGpdgCiErUX3a/3to4HgJZSq6Gqjy4IuScNnpWV55teyW/rWs4gTK9
yJF3O4Tn2Jq6hBN4WeDs4R79mR3rrAyVSddLzh+9DRQyISYBvVkqyJ5JQ6au+Ps9
HJsIKXC8G/yq7dd9vop+fBSR6743sLE0Sge67fhxrv4h8tr4xZnXvgr5eRgwMJZW
Jc/RDTPQGNZVrmiJYvKnUclNRLEbgnKrtryINWGt5nrRLMLu3gVjJGZxhESQqt8b
C5uVsf1wyyw+K02minkivCVbD0un6hafek5bpILCzjZzLjh1HYoOGY0x6Xcog0uX
tG4tTm/fOBqpHkJy4WbMBjuT5belbMyNwVrZNkNYjMK1WVRjZwc=
=U+bJ
-----END PGP SIGNATURE-----

--SJMSzPuygRaHqOAa--
