Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8356D68A8DE
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Feb 2023 08:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbjBDHwI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Feb 2023 02:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjBDHwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Feb 2023 02:52:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CFD2914E;
        Fri,  3 Feb 2023 23:52:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 42F69B800C1;
        Sat,  4 Feb 2023 07:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2A2C433EF;
        Sat,  4 Feb 2023 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675497123;
        bh=LZ5HxHKIqgDNLiMmCowZCRYWSKaiD7O1sWTuL4NMvMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jPf/sWdd2Kw2w4mI4NhIf8s3t/PmbTkdTMjGY5xjf0ggOKuJmFgZn7K/F7wDceL4s
         2ehncnLZFY3LTdBJUdV5/IstlH1n7qi7YtjYzTDE6HYUJrnWeZq1qfad4MOqmOWuce
         4YV28mz5vxanxRogb4wcwiljacDZHwxaq0jMZBnk=
Date:   Sat, 4 Feb 2023 08:51:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Visweswara Tanuku <quic_vtanuku@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni-se: Move qcom-geni-se.h to
 linux/soc/qcom/geni-se.h
Message-ID: <Y94On1PIUQw4/qX2@kroah.com>
References: <20230203210133.3552796-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203210133.3552796-1-quic_eberman@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 03, 2023 at 01:01:32PM -0800, Elliot Berman wrote:
> Move include/linux/qcom-geni-se.h to include/linux/soc/qcom/geni-se.h.
> This removes 1 of a few remaining Qualcomm-specific headers into a more
> approciate subdirectory under include/.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c                   | 2 +-
>  drivers/soc/qcom/qcom-geni-se.c                      | 2 +-
>  drivers/spi/spi-geni-qcom.c                          | 2 +-
>  drivers/tty/serial/qcom_geni_serial.c                | 2 +-
>  include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} | 0
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} (100%)

Who do you want to take this patch?  Through what tree?  I can take it
through the tty tree if no one objects, otherwise if someone else is:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
