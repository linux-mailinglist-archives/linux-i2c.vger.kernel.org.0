Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C6357F349
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 07:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiGXFEX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 01:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiGXFEW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 01:04:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8084C1401E;
        Sat, 23 Jul 2022 22:04:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68C1260C2B;
        Sun, 24 Jul 2022 05:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D04C341C0;
        Sun, 24 Jul 2022 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658639059;
        bh=0YmwIbeEqbGTfnGTxrbInMGVDmmA6ehx3ymKh4+1zvg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pAFuAD88/i3LadcYlmqVylb0mY7Z/PcTS3qPHPxC6meDSwqTW01cslhoCgcrdHPSM
         wabuQtt3bMWa7OX8wc12VXoK3cbrleicU+NMR4ilPc2bEk80yasu8Qx99vKkrvnLdx
         QCYgSDO6XnWEZg2picy4Iv/0I4SWIeDYaq3BQcZauxp8o3VPH5Vay0K3JSHkILGLes
         rBpqN1zGkLlVo+rBs5o+Rgd3LgTzb04PdLAs/Z4F7qAniBUxkDIrlYrtuEll7UP5t1
         X6SU9LTitl/YRfQS+RvCDsi8Ohz68U5p60lMdrxkz68txK0wRfL2BOoQVDZjHgcpPe
         Qeq1yDwd4EvBg==
Date:   Sun, 24 Jul 2022 07:04:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <YtzSzKmakEWe1usg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iwzItzDUiQg+EaOu"
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-2-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iwzItzDUiQg+EaOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	return num;
> +	return ret;

Not quite. Kdoc describes the retval in i2c_transfer.

2136  * i2c_transfer - execute a single or combined I2C message
2137  * @adap: Handle to I2C bus
2138  * @msgs: One or more messages to execute before STOP is issued to
2139  *      terminate the operation; each message begins with a START.
2140  * @num: Number of messages to be executed.
2141  *
2142  * Returns negative errno, else the number of messages executed.

I agree this needs better documentation in i2c.h, I will fix it.


--iwzItzDUiQg+EaOu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLc0sgACgkQFA3kzBSg
KbbfPw//W/0Wnk/u8fl/F5yc2lx7popFfxQ1t+LqVOzXsTYCb5XHbqe+/4mHVrBz
hwEY+GgFY5xHeK7Q/PE64YvQcvL4nkP2VF60kLaY2OsPGcQBZHLlp6oJ6Hnms4AL
vo0XlI7IDFZLWRSDIMGhQs7RQ5R1gCQpdzsQoFrNl5q1RZer+gMmJ72+6yZzTd9G
xeJZ77S0K721BB6g1qsdB4jtAIi0IjAihH9zfHrvI6snGVdyPF/9iKM0ow3ds1RW
Vgld3o3EvRUSKwBrttHRVUwquETxz/ljFEW9097A6zi+j6A/J3xNqhEsflHe7sgn
5nmQSl92m1FWDBtbOU3rcJ8H30z7xyxoAqagORBs7DRHHDkfz/CKNDjV8WHpPUrM
wCu+HJZ8Brd+XaFlSBL69TMNUTGOpYA8vSKjm9n82CDQdqcNJLSF0GJunsnqMX0u
RsQbuL48HOGewWt3Sytc4jpIy+qcvWcRjnjZflKQ7gre16OBVOg05tlzV1BLpatg
SMaJ85vT/vLq7gC4bjAOoScg+os/yE3y9D2CeJ19yeMBOHEGBw0DC2USe1kVlKxN
yZEZ4t5+qseKVnDtQGaGjgMow6LYqAXISKWoOUrfSvCmtsyM/bww9Hgu28zdheqp
EW56Uanjz2P1T2grLm7E3rcTlXKy+6XhvITNrkoldvPjyKXDkP0=
=omuO
-----END PGP SIGNATURE-----

--iwzItzDUiQg+EaOu--
