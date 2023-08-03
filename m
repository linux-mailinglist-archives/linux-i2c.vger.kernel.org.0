Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBD076EE69
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 17:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237185AbjHCPnb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 11:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235111AbjHCPna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 11:43:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6B0E46;
        Thu,  3 Aug 2023 08:43:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E548861E05;
        Thu,  3 Aug 2023 15:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A06C433C8;
        Thu,  3 Aug 2023 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691077409;
        bh=o5lDOGlSMgkOS8+bjI9f3nYBuq4WxTu2EPXnXhQghNA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W4AI6iY0/jmrSyWBadkt6FgWUFd0ICDngGq42rIutry4arbn0GWIclpZ8R1oqmw1J
         ROudyhvMeiVbfnyvyaxZkmxkBPiwpxsA+oGmoVxyhHk/IKNKujAmMFKxHDcn0752uo
         SMq/ITtRnTIjn5Le+nwz+aPIdHieG3WuJ5vvaxCiV/6o3wULMRjQQPp98dvfUcHiFm
         vv7UnKWwByHprqjg9nlNx2mWVSiwbKXUngxBmfNOPn0A7y2ri08O0NRQmJHxbt8mzr
         1Tqq4dzL5S5oBrYeiZ+biaCJN14CSJXWLk/jkFEvy9ufwpf2nVJD6kET9ezZPEsuW1
         6SjAJ8NrlflTw==
Date:   Thu, 3 Aug 2023 16:43:24 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Michal Simek <michal.simek@amd.com>
Cc:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com,
        Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: cadence: Describe power-domains
 property
Message-ID: <20230803-acclaim-glorifier-c44eba253122@spud>
References: <8774dba53cae5508f9f7aa173fbaf814d97898b1.1691047405.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ruRUQToyLvq0oy4g"
Content-Disposition: inline
In-Reply-To: <8774dba53cae5508f9f7aa173fbaf814d97898b1.1691047405.git.michal.simek@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ruRUQToyLvq0oy4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ruRUQToyLvq0oy4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMvLHAAKCRB4tDGHoIJi
0l10AQDsuzgh8cy5BQ5B8hvwE6SHu6yWUmBtP+nKHz2gSLB+EgD9EUlUBPzqfNKl
XcHNnawMSfS/3ZEQ3YA2evhW3qP9twA=
=0EhB
-----END PGP SIGNATURE-----

--ruRUQToyLvq0oy4g--
