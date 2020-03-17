Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB09188DAF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 20:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgCQTIJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 15:08:09 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43071 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgCQTII (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 15:08:08 -0400
Received: by mail-pg1-f193.google.com with SMTP id u12so12230776pgb.10
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=On3TrxZoVMdons7MAlatqGDBEMzx0AdGLFVPBawtJvU=;
        b=dTGZAr5dzgdyeK5IEQHe3/AX8VuLoWpQhT/VdhP4DJxoV0huV3rLqGkgxXzCGPZUVh
         6CDs+ql8xt71wGdob//nzp2vPt875xMXwNi1s1zh3/qkVeZ/klgLByohEg5l3T6G+l0A
         TVKjTHElHMwg7VbOL530xuKA5YkESysgoEoYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=On3TrxZoVMdons7MAlatqGDBEMzx0AdGLFVPBawtJvU=;
        b=JNOKvful8esZEyVOH64013J5n6arIfkneiji90urayrmNqkA4nCsCXLLd6xXGxKbkk
         /BO7unkGZpPXMWO03zLmmjsgeOBiwwwn33JTsSF0+WZnUkwmyv0pjEZzyi4uZI/VSVAL
         62BA+/1vc+USA6dPMLE7I6R/4trkwSAgHf5M6iA4byLoX2yJJpVL4Omkd4TIqMSPQujJ
         B8PHqN5EaqBprUfsYuYQ70ZTtG9JJj2DTX9oSIQm+9qTDojKAAKTDs3CWn+h93Fn/dJb
         p7aCcAvbmAnv5ipRK005eqBFbigLSD6K158mYBH/wiWFgeDdlSOkIQdj8FgVKfSdtzNf
         d5tQ==
X-Gm-Message-State: ANhLgQ08ut/DAoU9gmI9rICvMFRv+CPd0Wyog6czCIBkEn0fJtkCbra3
        YS5p9L7on+StKqOuGdiNKA391Q==
X-Google-Smtp-Source: ADFU+vvkCmnyxErpIIBJaoMb1mhIQeDb+8ADzUZb9zLtrMcZV2qJMZpZwCNT/H09Y9i+1Xm6FkXJ7w==
X-Received: by 2002:a63:790e:: with SMTP id u14mr615180pgc.361.1584472086000;
        Tue, 17 Mar 2020 12:08:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s123sm3795164pfs.21.2020.03.17.12.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 12:08:05 -0700 (PDT)
Date:   Tue, 17 Mar 2020 12:08:04 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 4/8] tty: serial: qcom_geni_serial: Add interconnect
 support
Message-ID: <20200317190804.GS144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-5-git-send-email-akashast@codeaurora.org>
 <20200313212833.GK144492@google.com>
 <e9293de6-004f-6005-8cb6-66f28c080ebe@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9293de6-004f-6005-8cb6-66f28c080ebe@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 05:18:34PM +0530, Akash Asthana wrote:
> Hi Matthias,
> 
> On 3/14/2020 2:58 AM, Matthias Kaehlcke wrote:
> > Hi Akash,
> > 
> > On Fri, Mar 13, 2020 at 06:42:10PM +0530, Akash Asthana wrote:
> > > Get the interconnect paths for Uart based Serial Engine device
> > > and vote according to the baud rate requirement of the driver.
> > > 
> > > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > > ---
> > > Changes in V2:
> > >   - As per Bjorn's comment, removed se == NULL check from geni_serial_icc_get
> > >   - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
> > >   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
> > >     path handle
> > >   - As per Matthias comment, added error handling for icc_set_bw call
> > > 
> > >   drivers/tty/serial/qcom_geni_serial.c | 69 +++++++++++++++++++++++++++++++++--
> > >   1 file changed, 65 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > index 272bae0..c8ad7e9 100644
> > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > >
> > > ...
> > >
> > >   static int qcom_geni_serial_request_port(struct uart_port *uport)
> > >   {
> > >   	struct platform_device *pdev = to_platform_device(uport->dev);
> > > @@ -962,6 +975,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
> > >   	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> > >   	unsigned long clk_rate;
> > >   	u32 ver, sampling_rate;
> > > +	int ret;
> > >   	qcom_geni_serial_stop_rx(uport);
> > >   	/* baud rate */
> > > @@ -983,6 +997,18 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
> > >   	ser_clk_cfg = SER_CLK_EN;
> > >   	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
> > > +	/*
> > > +	 * Put BW vote only on CPU path as driver supports FIFO mode only.
> > > +	 * Assume peak_bw as twice of avg_bw.
> > > +	 */
> > > +	port->se.avg_bw_cpu = Bps_to_icc(baud);
> > > +	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
> > > +	ret = icc_set_bw(port->se.icc_path_cpu_to_geni, port->se.avg_bw_cpu,
> > > +			port->se.peak_bw_cpu);
> > > +	if (ret)
> > > +		dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
> > > +			__func__);
> > Should this return an error? The port might not operate properly if the ICC
> > bandwidth couldn't be configured
> 
> This is void function we can't return error from here. I guess it would be
> somewhat okay if BW voting failed for CPU path but clk_set_rate failure is
> more serious which is called from this function, I don't think it can be
> move to somewhere else.

ok, I missed that _set_termios() is void.

> > >   static const struct uart_ops qcom_geni_console_pops = {
> > > @@ -1308,6 +1358,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> > >   	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
> > >   	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
> > > +	ret = geni_serial_icc_get(&port->se);
> > > +	if (ret)
> > > +		return ret;
> > > +	/* Set the bus quota to a reasonable value */
> > > +	port->se.avg_bw_core = console ? Bps_to_icc(1000) :
> > > +		Bps_to_icc(CORE_2X_50_MHZ);
> > Why different settings for console vs. non-console?
> 
> QUP FW runs on core clock. To support higher throughput we want FW to run at
> higher speed.
> 
> Since Console operate at 115200bps and BT operate at 3.2Mbps baud. We are
> voting higher on core for BT usecase.
> 
> These value are recommended from HW team.

IIUC none of the values you mention are set in stone. 115200bps seems to be a
'standard' value for the serial console, but it could be a different baudrate.
I guess you are referring to Qualcomm Bluetooth controllers, which are only one
of many things that could be connected to the port. And what happens when a
QCA BT controller is connected to a non-geni/QCA port, which doesn't know about
its 'requirements'? The answer is that both the BT controller and the serial
console configure the baudrate they need, hence using different values in
_probe() is pointless.

Unsurprisingly one of the first things the QCA BT driver does is to configure
the baudrate. It typically starts with a lower ('init') speed, and then switches
to the higher ('operational') baudrate:

https://elixir.bootlin.com/linux/v5.5.8/source/drivers/bluetooth/hci_qca.c#L1256
