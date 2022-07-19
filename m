Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D7157A8B4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 22:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236074AbiGSU5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jul 2022 16:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237433AbiGSU5o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jul 2022 16:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D3BE46D82
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jul 2022 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658264262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BU1ysNnuX0LIwiZ3pTBxSfBXfotqqRrKjBzOcGKldO4=;
        b=AeJnhIeh0ELCVwKggIk/7q9I/mpnfp2GS9dLESVUlxdBsihh5onxbT1EBqHdmF6mkyEa3N
        VX9ylZV9KBqAFNfSpmT1r7ncdJ6pSxfU7WP7kcPYvEe0yDZtk58G8S4jO455JSP/Zu6IvP
        CRDOQ1m6AXwiG3JhWD2RFev1eV8iMpM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-maudh7DBMLi1PiJDr7Y2dw-1; Tue, 19 Jul 2022 16:57:41 -0400
X-MC-Unique: maudh7DBMLi1PiJDr7Y2dw-1
Received: by mail-qt1-f199.google.com with SMTP id f1-20020ac84641000000b0031ecb35e4d1so10872340qto.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jul 2022 13:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BU1ysNnuX0LIwiZ3pTBxSfBXfotqqRrKjBzOcGKldO4=;
        b=E1kmN7XHSegCCv3pRBnAYQEVmg6aPorlogpZz13zModM34Ki9yZ3j9thIVb9MpC55G
         W4UgWvMwXu5fWFyovvatiQ+biHFdCv6op9TMOTIH9jmPppDVwi9d+pOd53xoYK5/B7aW
         KnVDyCZqZ+8PVtHbnjE/h31yQMc+HIyZuDOFdsXuw/l2PIBjnXoo+cfs7F+1iknC+Alv
         nwJunzBcVE6Iioo0mWs1ewiOKJHJNG0HNEzkq2ZJ9OptNo6otWX3+pFYoPdAosbCLnIb
         2mWJTZCMwF7xe7bj676I+j20yKJb4ANwV1l8BwimioPC5O6CH4crfe+r7lUsmV0WwgzL
         0jYQ==
X-Gm-Message-State: AJIora9O8FYmeUC5raQR7SlnE12gAbz0lagwWgdp1X6ZQZ8zmbzyLIf6
        JlMa3u3i5BTwUguyfxyojBddhDA7COYjydJOGWU0zkxod5WrRwQKrY9ZmQmsoP1RQBBdGB268VB
        Ddr6YtfQd5xHAqruu+Ux5
X-Received: by 2002:a05:6214:c4e:b0:473:276:9a0d with SMTP id r14-20020a0562140c4e00b0047302769a0dmr26679741qvj.34.1658264260552;
        Tue, 19 Jul 2022 13:57:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgsBqiDB0vtpYN6xkBWfSCmwv8Yq3yxes/XhPK91Pu3WugSMA0l7MwHatd1f2v4sbX84YIRA==
X-Received: by 2002:a05:6214:c4e:b0:473:276:9a0d with SMTP id r14-20020a0562140c4e00b0047302769a0dmr26679729qvj.34.1658264260350;
        Tue, 19 Jul 2022 13:57:40 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a0c4c00b006a6ebde4799sm15890370qki.90.2022.07.19.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 13:57:40 -0700 (PDT)
Date:   Tue, 19 Jul 2022 15:57:38 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Propagate GENI_ABORT_DONE to
 geni_i2c_abort_xfer()
Message-ID: <20220719205738.j6cxwuogbqtqfjnw@halaneylaptop>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-3-bjorn.andersson@linaro.org>
 <20220719205054.rdhinuwxgabbsiht@halaneylaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719205054.rdhinuwxgabbsiht@halaneylaptop>
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 19, 2022 at 03:50:54PM -0500, Andrew Halaney wrote:
> On Sat, Jul 16, 2022 at 08:50:26PM -0700, Bjorn Andersson wrote:
> > Waiting for M_CMD_ABORT_EN in geni_i2c_abort_xfer() races with the
> > interrupt handler which will read and clear the abort bit, the result is
> > that every abort attempt takes 1 second and is followed by a message
> > about the abort having times out.
> > 
> > Introduce a new state variable to carry the abort_done state from the
> > interrupt handler back to geni_i2c_abort_xfer().
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 3bec7c782824..e212e7ae7ad2 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -97,6 +97,7 @@ struct geni_i2c_dev {
> >  	struct dma_chan *tx_c;
> >  	struct dma_chan *rx_c;
> >  	bool gpi_mode;
> > +	bool abort_done;
> >  };
> >  
> >  struct geni_i2c_err_log {
> > @@ -203,9 +204,14 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
> >  		dev_dbg(gi2c->se.dev, "len:%d, slv-addr:0x%x, RD/WR:%d\n",
> >  			gi2c->cur->len, gi2c->cur->addr, gi2c->cur->flags);
> >  
> > -	if (err != NACK && err != GENI_ABORT_DONE) {
> > +	switch (err) {
> > +	case GENI_ABORT_DONE:
> > +		gi2c->abort_done = true;
> > +		break;
> > +	default:
> >  		dev_err(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
> >  		geni_i2c_err_misc(gi2c);
> > +		break;
> >  	}
> >  }
> >  
> 
> If I'm reading this right this changes the behavior on a NACK error now,
> right? Was that intentional?
> 
> Otherwise looks good to me.
> 

Hmmm (I should really review the whole series before hitting send :P ),
it seems you cleaned the NACK stuff up in the next patch in the series.

I guess one more thing, does this patch deserve a Fixes: tag? If so
might be nice to make NACK not so loud in this patch in case it gets
backported without the next patch.

Thanks,
Andrew

> > @@ -311,21 +317,21 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
> >  
> >  static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
> >  {
> > -	u32 val;
> >  	unsigned long time_left = ABORT_TIMEOUT;
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&gi2c->lock, flags);
> >  	geni_i2c_err(gi2c, GENI_TIMEOUT);
> >  	gi2c->cur = NULL;
> > +	gi2c->abort_done = false;
> >  	geni_se_abort_m_cmd(&gi2c->se);
> >  	spin_unlock_irqrestore(&gi2c->lock, flags);
> > +
> >  	do {
> >  		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
> > -		val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
> > -	} while (!(val & M_CMD_ABORT_EN) && time_left);
> > +	} while (!gi2c->abort_done && time_left);
> >  
> > -	if (!(val & M_CMD_ABORT_EN))
> > +	if (!time_left)
> >  		dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
> >  }
> >  
> > -- 
> > 2.35.1
> > 

