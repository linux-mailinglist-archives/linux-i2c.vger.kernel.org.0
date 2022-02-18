Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C04F4BB2DA
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 08:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbiBRHGt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 02:06:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiBRHGr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 02:06:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9853C9024B;
        Thu, 17 Feb 2022 23:06:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B932B82486;
        Fri, 18 Feb 2022 07:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A1CC340E9;
        Fri, 18 Feb 2022 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645167986;
        bh=QJPbN3zuIFj6R/D7I1HLXCBbU2fB00n1t4O0aal5Tc0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cgrIS+wndLdGLfD5FJUJai7yFBfhaBwN+0AEv07k2WFCbvJ6IeU8OytKUMI3CLV6A
         EvmQG6RIat5X0C6GoXlqLy6zOLnfztj/dYTQQPPNPpUyawE8pK568arYvU6kS62xLk
         svcpJoqDxDQGkfxeSdUKZ/U2ZBCm1aTxIaN0ZcjY8m/dc/hekCgtz2YDiLtH42gdYG
         J+F2GuqmNr09DQ5h7glj/TUxqMuvUkoBWZyxYnnXMMxoJTj/OTE5g+0m+mSuX+sS9h
         yZqQSWr8CG83DXDv3bQ4MXyzILyupI9KB+R/nvlNvXyYdJj8HQmxAoqmqJZZGkGTSL
         sSfd6gTQO9qIg==
Date:   Fri, 18 Feb 2022 12:36:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH v5] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <Yg9Fbh//iSe+VAiT@matsya>
References: <20220131120403.2481995-1-vkoul@kernel.org>
 <CAA8EJpoqCJbYgOUpEhcoae3=Mivp8c7PZU8XO78EMZMR+NQQKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoqCJbYgOUpEhcoae3=Mivp8c7PZU8XO78EMZMR+NQQKw@mail.gmail.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17-02-22, 20:51, Dmitry Baryshkov wrote:
> On Mon, 31 Jan 2022 at 15:04, Vinod Koul <vkoul@kernel.org> wrote:

> > +static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
> > +                             struct i2c_msg msgs[], int num)
> > +{
> > +       int i, ret = 0;
> > +
> > +       for (i = 0; i < num; i++) {
> > +               u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
> > +
> > +               m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
> > +
> > +               gi2c->cur = &msgs[i];
> > +               if (msgs[i].flags & I2C_M_RD)
> > +                       ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
> > +               else
> > +                       ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
> > +
> > +               if (ret)
> > +                       break;
> 
> I'd suggest to 'return ret' here and change the return line to 'return num'.

Done

> >  static int geni_i2c_xfer(struct i2c_adapter *adap,
> >                          struct i2c_msg msgs[],
> >                          int num)
> >  {
> >         struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> > -       int i, ret;
> > +       int ret;
> >
> >         gi2c->err = 0;
> >         reinit_completion(&gi2c->done);
> > @@ -475,22 +670,11 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
> >         }
> >
> >         qcom_geni_i2c_conf(gi2c);
> > -       for (i = 0; i < num; i++) {
> > -               u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
> > -
> > -               m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
> > -
> > -               gi2c->cur = &msgs[i];
> > -               if (msgs[i].flags & I2C_M_RD)
> > -                       ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
> > -               else
> > -                       ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
> >
> > -               if (ret)
> > -                       break;
> > -       }
> > -       if (ret == 0)
> > -               ret = num;
> > +       if (gi2c->gpi_mode)
> > +               ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
> > +       else
> > +               ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
> 
> We should return num if ret is 0 here (or in
> geni_i2c_fifo_xfer()/geni_i2c_gpi_xfer()).

I have picked your fix for that!
-- 
~Vinod
