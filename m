Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEABF71F381
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 22:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjFAUQM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 16:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjFAUQM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 16:16:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F2ED1;
        Thu,  1 Jun 2023 13:16:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9274E6494B;
        Thu,  1 Jun 2023 20:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F1CC433EF;
        Thu,  1 Jun 2023 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685650570;
        bh=wGPqJrvnThf2mG968n+KNP3y1zAJ7zJqs9zWqYFuPsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cVPNfgg0tmc/Hg74YF1KHv0xBe7isHo/YFggxip+dCk8ewu3DFZpETA9JK4uG/jZU
         i8A04VJbhCzl00dhGSDlVW2O4TQmkyBSvs+HAaEylFKyddMxyVZTsP2SM6WCflMRcg
         cG4rs6oyzLpSXrj38X7D3+8OZ3mc9DdAMHfI45TOzA411/3X6nadMDhvl56oc2osHG
         QLvlj1piJfw1VWKZdZxiVfu8Q2kbCd/ixrWL8umSU4q+pyLpffoF+6Kr0P50flLpTT
         3J2UleCccULReH9OmReyIpikC/4TkinQdLXclbta2W+0HjUcj0nPmhqHb+dPnCBYcV
         0TU3n8DuGhUkQ==
Date:   Thu, 1 Jun 2023 21:16:04 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Message-ID: <20230601-exception-dodgy-97f2101d8a0e@spud>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
 <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
 <ZHjtExYIdVFo3HnB@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7maM1k8I9uCkvnld"
Content-Disposition: inline
In-Reply-To: <ZHjtExYIdVFo3HnB@makrotopia.org>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7maM1k8I9uCkvnld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 01, 2023 at 08:10:11PM +0100, Daniel Golle wrote:

> Adding the clocks is done in patch 2/2 which just wasn't sent to
> devicetree@ and dt maintainers, but to the relevant mailing lists
> instead. Was that wrong and should I always send the complete series
> also to devicetree@ as well as dt maintainers?

Everyone is different, but getting both patches of a 2 patch series
really should not annoy anyone and avoiding reviewers having to go
hunting on lore etc is always a positive :)

--7maM1k8I9uCkvnld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHj8hAAKCRB4tDGHoIJi
0gCxAPwJluO3r1kS32M0uweKJEPBXY4qvnAqMUrRvS0VRe6FegEAwEfuZCOXUdWI
wW51d5BeoLvyIEciuumYzFvE7tKmtg4=
=5SNU
-----END PGP SIGNATURE-----

--7maM1k8I9uCkvnld--
