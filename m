Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3EA7BD045
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Oct 2023 23:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjJHV2a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Oct 2023 17:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjJHV23 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Oct 2023 17:28:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DAC9D;
        Sun,  8 Oct 2023 14:28:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FD3C433C7;
        Sun,  8 Oct 2023 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696800508;
        bh=nQGWKZiyHBv6B4a2iISbyjNNNeRSkrsuiZCq95X2HsI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZGH8vFeD3P+e5W18SGGGuMO7pnRPit9L6JH4GVO8pqloZKkJZyekCXtN4O6nDHB3c
         DcQ0v6fNnsKA2smebnULTaa91hcoOchINv9ytFKlbrL8d+XxyGTr+CqBikJDUw8yk3
         4IqCcaW8ZC4MwQCHSgbJe4nRGgrZpei2Xq6+X9yuXoUL/9Dv8T2FGYlQBgeTQy79T0
         Lhd+UghpG7bWqJJkZYyXoe4hTLqIXP/59UxnWOfY4sVmNWbh7nPVf1jz/ho8+BstGn
         A2H/7IiVGESt+ih4Dt/fEkicEDnfmvV9vDWACSPoUDZWsUUMZM+TcJUWMdTRX/H8VE
         oKBkFxWFiqb0g==
Date:   Sun, 8 Oct 2023 23:28:24 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: qcom-cci: Add sc8280xp compatible
Message-ID: <20231008212824.cs6e6hc7zur67v6k@zenone.zhora.eu>
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-3-bryan.odonoghue@linaro.org>
 <b8f2d7f1-16e2-4e6a-9c84-37da393f74a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8f2d7f1-16e2-4e6a-9c84-37da393f74a3@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Konrad,

> > Add sc8280xp compatible with cci_v2_data parameters.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> Drop this patch, it adds nothing useful

what about the rest of the series?

Could you please be a bit more explicative?

Thanks,
Andi
