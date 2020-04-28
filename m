Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F0D1BC404
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 17:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgD1PsM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 11:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728117AbgD1PsM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 11:48:12 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0074AC03C1AD
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 08:48:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a31so1304239pje.1
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5qg09P4fJgr+a4V0kkb6T7N6RFRG+NYeOfMhOPT4/Dc=;
        b=JDSThlqmXtrKvxvHRB6TPWEqVdcqPId/GP5ROJiq6/aWYOFWWaWAQZaEO5O41nBgtA
         SkL8uF+189EbZWOKop390c8l3PRBjmtLVJWX2b+NGwaNX4iX0nlUPfDsAFacz/D+VqC5
         E9M0BgOw26tKTlf2vgBUIRRD5BeJwPGtZ7Wg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5qg09P4fJgr+a4V0kkb6T7N6RFRG+NYeOfMhOPT4/Dc=;
        b=NmmNaqS0dCDexxIyCcbS87a5lyxKT54ExBzripZFb0MexTX6CGwop6HHFF1gAtY1vI
         TRAVL07NoHjwmR4hUfQXAOQWF7uDPXYFjiCBLjyZFh8m74VIj2+vvozWxZbJpdm+AnH5
         wKnffuDdUpqHIw8WDBgkh+lkcfpsNa5XZwOuhva/wZcvg7twjbNyt+A2H6b/2kEFNjws
         VqM4GMdWa4IOCtaXlS314kjbRkyPyFzDDKbJ5uereiuPOMeyMr8mOpv4ayP4YdyMP3Ex
         hsuHDMJx88GAGbW0M8BaOvW2tCCebWAmsM0tZuYE0l5jIYgXliibH1RfSXPOeLlF79n7
         71yw==
X-Gm-Message-State: AGi0Publm+ksu/jlEe334+m4Yhjc+rBNjX7BNVPUYt1r59NkoY9EHOqf
        o5FSgOLTkm9gjwq0A8exm2pf9w==
X-Google-Smtp-Source: APiQypKnhe6XWsZGMGHpEQeihQ6bHdJTrY0q2pMJXMds500wkrvQkChdn9JC76eSbx48i4opUzXQoA==
X-Received: by 2002:a17:90a:d985:: with SMTP id d5mr5793380pjv.171.1588088891211;
        Tue, 28 Apr 2020 08:48:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id v1sm2392709pjs.36.2020.04.28.08.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 08:48:10 -0700 (PDT)
Date:   Tue, 28 Apr 2020 08:48:09 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V4 4/9] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200428154809.GH4525@google.com>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-5-git-send-email-akashast@codeaurora.org>
 <20200416003112.GA199755@google.com>
 <146cf8db-3c09-39a6-2886-bec0db289948@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <146cf8db-3c09-39a6-2886-bec0db289948@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Tue, Apr 28, 2020 at 03:51:44PM +0530, Akash Asthana wrote:
> Hi Matthias,
> 
> On 4/16/2020 6:01 AM, Matthias Kaehlcke wrote:
> > Hi Akash,
> > 
> > On Wed, Apr 15, 2020 at 03:53:13PM +0530, Akash Asthana wrote:

...

> > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > index 6119090..8c5d97c 100644
> > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > @@ -1090,6 +1090,12 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
> > >   	__qcom_geni_serial_console_write(&dev->port, s, n);
> > >   }
> > > +static int qcom_geni_serial_earlycon_exit(struct console *con)
> > > +{
> > > +	geni_remove_earlycon_icc_vote();
> > > +	return 0;
> > > +}
> > > +
> > >   static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
> > >   								const char *opt)
> > >   {
> > > @@ -1135,6 +1141,7 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
> > >   	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
> > >   	dev->con->write = qcom_geni_serial_earlycon_write;
> > > +	dev->con->exit = qcom_geni_serial_earlycon_exit;
> > The idea of using the exit handler of the early console to remove the
> > votes seemed appealing at first, however it has a drawback: the bandwidth
> > requests in geni_se_probe() are always made when CONFIG_SERIAL_EARLYCON=y,
> > also when the system doesn't actually use an early console. On such a
> > system the votes would never be removed.
> > 
> > A possible alternative could seem to remove the vote at the end of
> > qcom_geni_serial_probe() of the 'normal' console, but it has a similar
> > problem: the system could not even have a normal console. One could
> > possibly argue that CONFIG_SERIAL_QCOM_GENI_CONSOLE shouldn't be set
> > on such a system, however it could be enabled to have a console for
> > development, and in production the same kernel config is used, but
> > with the console disabled through the device tree.
> > 
> > I don't really have a good idea at this point, maybe we just need
> > something as ugly as a delayed work to remove the votes. Other
> > suggestions are welcome :)
> 
> I think we can do something like below. Before voting we are checking
> whether earlyconsole ("qcom_geni") exits or not.  The name is fixed from
> earlycon declaration file@drivers/tty/serial/qcom_geni_serial.c
> 
> OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
>                                 qcom_geni_serial_earlycon_setup);
> 
> ====================================================================================
> 
> @@ -809,6 +809,8 @@ static int geni_se_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct resource *res;
>         struct geni_wrapper *wrapper;
> +       struct console *bcon = NULL;

nit: initialization is not needed

> +       int earlycon_present = 0;
>         int ret;
> 
>         wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
> @@ -832,6 +834,15 @@ static int geni_se_probe(struct platform_device *pdev)
>         }
> 
>  #ifdef CONFIG_SERIAL_EARLYCON
> +       if (console_drivers)
> +               for_each_console(bcon)
> +                       if (!strcmp(bcon->name, "qcom_geni")) {
> +                               earlycon_present = 1;
> +                               break;
> +                       }
> +       if(!earlycon_present)
> +               goto exit;
> +
>         wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
>         if (IS_ERR(wrapper->to_core.path))
>                 return PTR_ERR(wrapper->to_core.path);
> @@ -858,6 +869,7 @@ static int geni_se_probe(struct platform_device *pdev)
>         of_node_put(pdev->dev.of_node);
>  #endif
> 
> +exit:
>         dev_set_drvdata(dev, wrapper);
>         dev_dbg(dev, "GENI SE Driver probed\n");
>         return devm_of_platform_populate(dev);
> 

This should work as long as the early console is always set up before
geni_se is probed, which seems a safe assumption.
