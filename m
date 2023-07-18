Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39F37572D8
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jul 2023 06:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjGREiA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jul 2023 00:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjGREh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jul 2023 00:37:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A02E55;
        Mon, 17 Jul 2023 21:37:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8792061447;
        Tue, 18 Jul 2023 04:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F5FC433C8;
        Tue, 18 Jul 2023 04:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689655076;
        bh=6wZPMKCBagUOFTDmVauFkFIPJOAzlX+PQYJ+0aOInqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qK7EBTOFgzQxyna+0gJbjwtrE/V91mTwbqEQXxcuyLr4nVrQgq7BhwrrF8RWlurLO
         zcPPJ8qbACQsOlBZ8cvAw1vFp1FHpOkCr9KD8EWj6HUTLSm0bhnbIMOSVipieEbUmG
         39Tu/xUBhzGWOdz8zjqVih769M7Kqb9oEf0Y9vE3ywvbLw80yS+Va1KG4p3M7gX71M
         nPJ/5FORi0UP8Y6ZJtErSo/Dd6t4trFQNR3zybgr83wS+GVDgCCOJArSGXyuSFvWBJ
         fYWR8CFQmSGmLCTxv10kZjd7scXp1f3se+0H9tJACaWJIEFinE3C2ZY8NNlRN7exJq
         ArBoi/e+wP23g==
Date:   Mon, 17 Jul 2023 21:41:20 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sibi Sankar <sibis@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] interconnect: qcom: sm8250: Fix QUP0 nodes
Message-ID: <xnekcag622zywfat6zljhwt5q2boc3k2akr7uu7rezy2vkwsm7@slzdu4hm6im4>
References: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
 <20230703-topic-8250_qup_icc-v2-3-9ba0a9460be2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703-topic-8250_qup_icc-v2-3-9ba0a9460be2@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 03, 2023 at 10:15:27PM +0200, Konrad Dybcio wrote:
> The QUP0 BCM relates to some internal property of the QUPs, and should
> be configured independently of the path to the QUP. In line with other
> platforms expose QUP_CORE endpoints in order allow this configuration.
> 
> Fixes: 6df5b349491e ("interconnect: qcom: Add SM8250 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
