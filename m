Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD09D68FDC4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 04:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjBIDMx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Feb 2023 22:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjBIDMc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Feb 2023 22:12:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CEE171B;
        Wed,  8 Feb 2023 19:12:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1CF75B81F26;
        Thu,  9 Feb 2023 03:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FA0C433EF;
        Thu,  9 Feb 2023 03:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675912348;
        bh=WciJPmWjrdkAu/AdG2AoQtQaZofqnWGrKhzOfMYWg+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QtwyQF9o3p0KFqkdkSDJYjhethrwoimEcYY1YxlN3QDEcorv2pIaSOAggBvXnu88I
         yDzIiNfnj5NNlplB6LPS1CIM7FL9Iey7FQqx7HmbdVXpfqh6iYeaSsTaws2dmLJSdx
         YPNJ2bDf9e7TG8w5KsM2JrWmd5ueM25L7zvWH8rJXLAc7nC6KpH9Pwc1kQi415u9YF
         a7uyl6r4h4OiW4WsngFn6sd/I8HZ9tWNtjpiz+BwuHhxPId8iz45bkTh9H8dLlyFlB
         Vd3Bu3etUs6NOYrx/WMOQlRuuYTiZlMws338CR27OXLc8m32QXBcOIrYu+TAiE34jw
         NcACrhOx3x5Fw==
Date:   Wed, 8 Feb 2023 19:14:40 -0800
From:   Bjorn Andersson <andersson@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Elliot Berman <quic_eberman@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Visweswara Tanuku <quic_vtanuku@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni-se: Move qcom-geni-se.h to
 linux/soc/qcom/geni-se.h
Message-ID: <20230209031440.yu3mentazf6gk4m7@ripper>
References: <20230203210133.3552796-1-quic_eberman@quicinc.com>
 <Y94On1PIUQw4/qX2@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y94On1PIUQw4/qX2@kroah.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Feb 04, 2023 at 08:51:59AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Feb 03, 2023 at 01:01:32PM -0800, Elliot Berman wrote:
> > Move include/linux/qcom-geni-se.h to include/linux/soc/qcom/geni-se.h.
> > This removes 1 of a few remaining Qualcomm-specific headers into a more
> > approciate subdirectory under include/.
> > 
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c                   | 2 +-
> >  drivers/soc/qcom/qcom-geni-se.c                      | 2 +-
> >  drivers/spi/spi-geni-qcom.c                          | 2 +-
> >  drivers/tty/serial/qcom_geni_serial.c                | 2 +-
> >  include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} | 0
> >  5 files changed, 4 insertions(+), 4 deletions(-)
> >  rename include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} (100%)
> 
> Who do you want to take this patch?  Through what tree?  I can take it
> through the tty tree if no one objects, otherwise if someone else is:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I'm happy with that, please go ahead Greg.

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
