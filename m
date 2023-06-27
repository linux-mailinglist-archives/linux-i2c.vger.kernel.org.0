Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83461740589
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 23:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjF0VZ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 17:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjF0VZ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 17:25:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6706DA3;
        Tue, 27 Jun 2023 14:25:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F39346121E;
        Tue, 27 Jun 2023 21:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37C2C433C0;
        Tue, 27 Jun 2023 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687901125;
        bh=LLkc2ILV6ywjaYsJmFGJxIn1C9hBkqgWAvWAxsYMweY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GrIvmvKm4mW6fWrlM5EQedJxF9Vg6pFbJsQQq+UgX2FcWtY2N/NjcUTWOiCzJXZe0
         L3mP7B8Yfy2ruk313zezDEqfeE3CWVVEV70vvO1Bc9hJCX2nquDzeNgfexjyaZxQN3
         ZDGopNcXveae1dZV9dZZe1qvvaB1+r8pcES/UYNNgjqqMVzATnWbSdTCAX8gJDlHOV
         V2IuLEYq/54xoGzd/DJp1MPrC2ZVIxkgRL8ZitV3UvHxuT2Sw7oJWJ5YyfcJLq5jmI
         hj47mcFRYyH25RGPqeJSzgQ7gLWHYTALJ8qw+KYJu5+5Y+0enr1lUXMiJl30ie+myn
         NCVN/efKZV3ng==
Date:   Tue, 27 Jun 2023 23:25:18 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Message-ID: <ZJtTvleO7JURiBCQ@sai>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
References: <20230606182558.1301413-1-robert.hancock@calian.com>
 <20230606192453.zjzz4kt76kus5hr5@intel.intel>
 <c763371c710c9952154496026610e2ff583c173a.camel@calian.com>
 <20230606212053.bwpoxyost4fkpati@intel.intel>
 <ZINGGmRLYEQ+NfkI@shikoro>
 <20230609212552.5o6aopv7iicej3kn@intel.intel>
 <71637721f64b877255264d36293208402ef1a873.camel@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hh0iSTnw4k1MeSzd"
Content-Disposition: inline
In-Reply-To: <71637721f64b877255264d36293208402ef1a873.camel@calian.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Hh0iSTnw4k1MeSzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Just checking on this patch, was it merged? It shows accepted in
> Patchwork, but I'm not seeing it in the Git tree.

Sorry, it seems I forgot to apply it? I will make sure it will go in
this merge window now.


--Hh0iSTnw4k1MeSzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSbU7oACgkQFA3kzBSg
KbYpOA//bjyDt9DrMbTJmw34YKX4aWiIoWxF3WyWSAa18PcNV8k7zDlKWGJBtPfh
sjaI5S7WIvzGgfUrJTR+uI7UjIFcIYRR+G2/XEjBsERSNx99m6K9t4ntJKPIeg3d
E48ScalSM7tf/vfzc8NWB8MDeuC6iP2RHxPkIiP5Hojzapemse5JepqVr9v/m+yP
LQs/Cz8fehWO9Dw2OityhtkVcuQhYRY9P/z8c3/PfNt/iMip8VopVRppCQoIr2WB
3m/0YasQy6H44o8SdNnehPl8Z6bst2jGFr0D1iapu9sFKYBWQjbYYjwD8IPrgSj1
7vSkNo7pC4oabwwTzfPDoNr9fQEcy0Erz5qd2kHmMT0jDs2P+YYRW6vnG9tZcTZ9
K+e/0pL0WdVNGF8ifDxGQXiVxNvhjk7ggBSpGb/hilyqTf1sXxeZ0wNJGmUltzbA
rTMwFJ1gX2mcZh2TGQ9j8M3II51csiAxk26OuMgqcfGmwrGjmx8Yr5PFhXklosG8
Bogs8m74OyIrS61YCxK/QyvGUKRtopoAcc6RFbFsTs1fJgMR22f4tmDEn1AsuoaY
n8yYQfNdoYxtwnqZ/HInWPjHOyga+3W4BOK7ThoJydcbee0ibwSrOmf03Zid/WTg
f412ojOmiBWwsXsSe6L5t/HxX9rVDmXwTZQ9C7LWoFOy3N4y2vo=
=Iuvi
-----END PGP SIGNATURE-----

--Hh0iSTnw4k1MeSzd--
