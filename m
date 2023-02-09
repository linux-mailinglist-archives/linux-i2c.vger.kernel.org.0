Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66586908B0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 13:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBIM1i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 07:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBIM1h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 07:27:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1CE2D6D;
        Thu,  9 Feb 2023 04:27:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C7CA2B8164F;
        Thu,  9 Feb 2023 12:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEECFC433D2;
        Thu,  9 Feb 2023 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675945653;
        bh=D+nGnWzczf+mcGc087BP9v6X7kdlHtQOfrzRsw8KHUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wnhBsLWELkudMkbnGpP+vqDJIEiLLygGEbdZCHbKO5wL7nGpO8cAiKW1Vqe0NfE55
         mxFCARMiHekcT/gvuaBCLgpc/UMcOUn6EtC9kTt4S8j9VkiEQ32VsHeDetktt9w9m4
         Fu9WY8auL5zROXDX2O/84GzanYdXGr7AFfUY2spY=
Date:   Thu, 9 Feb 2023 13:27:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <andersson@kernel.org>
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
Message-ID: <Y+TmsqQZvX/rJW2U@kroah.com>
References: <20230203210133.3552796-1-quic_eberman@quicinc.com>
 <Y94On1PIUQw4/qX2@kroah.com>
 <20230209031440.yu3mentazf6gk4m7@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209031440.yu3mentazf6gk4m7@ripper>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 08, 2023 at 07:14:40PM -0800, Bjorn Andersson wrote:
> On Sat, Feb 04, 2023 at 08:51:59AM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Feb 03, 2023 at 01:01:32PM -0800, Elliot Berman wrote:
> > > Move include/linux/qcom-geni-se.h to include/linux/soc/qcom/geni-se.h.
> > > This removes 1 of a few remaining Qualcomm-specific headers into a more
> > > approciate subdirectory under include/.
> > > 
> > > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > > ---
> > >  drivers/i2c/busses/i2c-qcom-geni.c                   | 2 +-
> > >  drivers/soc/qcom/qcom-geni-se.c                      | 2 +-
> > >  drivers/spi/spi-geni-qcom.c                          | 2 +-
> > >  drivers/tty/serial/qcom_geni_serial.c                | 2 +-
> > >  include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} | 0
> > >  5 files changed, 4 insertions(+), 4 deletions(-)
> > >  rename include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} (100%)
> > 
> > Who do you want to take this patch?  Through what tree?  I can take it
> > through the tty tree if no one objects, otherwise if someone else is:
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I'm happy with that, please go ahead Greg.
> 
> Acked-by: Bjorn Andersson <andersson@kernel.org>

Great, now queued up, thanks.

greg k-h
