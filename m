Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2545EE5DE
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 21:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiI1Tlg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 15:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbiI1Tlf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 15:41:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98DC6CF72;
        Wed, 28 Sep 2022 12:41:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6817861FA2;
        Wed, 28 Sep 2022 19:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514D7C433C1;
        Wed, 28 Sep 2022 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664394092;
        bh=L4wI/Iy/Hvy1t+mxDGgavHpOXBY/G6XJ2sDt9HOV5C4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TNXnkh+xvtBRP0FGyVrF+6QJFYr4PhrbUtWevAm51PhB/TczXKbvkctqdor4kleWi
         IZ7O8eHZQkvHI27VASX8ey+amepdoi31PbLf8WjszGlxrrBqs/2dHBmB1+qU8nANsP
         9ROm1vxFD0M05nbbzyDi0XTwlnuiR23CCuL735FbW+2wVN4hCbsNH8OFXB1MItis5O
         ybNXutXTzndrREknPNGnD+8Bqiep+fEXLElHiu9p3M3qj1uQ2hWxG2CNQKYb92yuug
         p36JQT7mS55PbGbjFESaSxUD/xnsnwBy3/N6EYSxe6PiDfyc4K2QrG89Zkm43f3o4c
         nh3gLRyLcRdoQ==
Date:   Wed, 28 Sep 2022 21:41:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        Thang Nguyen <thang@os.amperecomputing.com>
Subject: Re: [PATCH] docs: i2c: slave-interface: return errno when handle
 I2C_SLAVE_WRITE_REQUESTED
Message-ID: <YzSjaVQUm/B4Jtwf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        Thang Nguyen <thang@os.amperecomputing.com>
References: <20220915035440.2862532-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o0g4JCU6qqmLJtFX"
Content-Disposition: inline
In-Reply-To: <20220915035440.2862532-1-quan@os.amperecomputing.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o0g4JCU6qqmLJtFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 10:54:40AM +0700, Quan Nguyen wrote:
> In case backend is not ready, ie: fail to wakeup or initialization, on
> the returning of the I2C_SLAVE_WRITE_REQUESTED event, bus driver should
> aware the backend status and might auto sending NACK on the next
> incoming bytes for I2C master to retry.
>=20
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Links:https://lore.kernel.org/linux-arm-kernel/556fa9e1-c54b-8370-4de7-c2=
d3ec7d6906@os.amperecomputing.com/

Sorry for the delay. I made some wording more precise and applied it to
for-next. So, we can use it right for next merge window, if needed.

Thank you for suggesting this and for your patience!


--o0g4JCU6qqmLJtFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM0o2kACgkQFA3kzBSg
KbY+mA/9Gq0SHrWiB960zD9EjwY3wrcum5yFzEgTnsKuHuDtalMvKog4bPY+JhfS
W2MPyYrx889UuKZnoFtYlE0DHL/PLsuNw/g747xdszBxmmr5pjUY3GbAdlex7nuc
70BkWOy6Znk4j1h9/cX5bTILGiVgU7/uZvW55ysXJ24N4rcvVQ80lOp5zktOYTqH
joF4cqZfgZ8jfAQstyox//TpnpZEEQ3utYrZwcLNjtiXXYPZhm92UFMIYIY8w4XF
YhThuEnn0uivW4z+mdLkvlyg5wc3kuTMiwjUSv0up7YVTnuKs32GbK1ucS9XL4Xt
eVf8PemU2vHmnR2r/QE8Efc/vBoCz1wHUaTBGnn2t0+BznG/N0KqNA/r6q3T5CMn
q5CQKlSaNQJ55Ssa9PNeu6I67uC6aA/pNAOLkdI3bk17CydIRuO9znm41NoF4Rjn
eIbzuKMYi3Xfa0QcsZTePk3Pvvusz95TA+vykRL2n4nrcrse15ks214gaDd9ZNCI
R4tKzPoSZfG8Ob9XzxjIZRv6wtL29L4gcdEmzcdLnfdOi6yM9NqxcUInZllF27Mp
TYhQQTyXpZb/nhXPLV4Nho2KOfeu9XbNPa4ttWHWh5aM/Lg7C6YyuwbFO0Pi0FZD
daqIvCxRgqNW51ziUBO8TqJmxw+RL6p9qTy69xgavaEfc5gbB2o=
=yx0h
-----END PGP SIGNATURE-----

--o0g4JCU6qqmLJtFX--
