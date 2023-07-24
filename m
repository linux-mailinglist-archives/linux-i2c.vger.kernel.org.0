Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9549375FC54
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 18:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbjGXQiz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 12:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbjGXQiy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 12:38:54 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE43E4F;
        Mon, 24 Jul 2023 09:38:53 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6689430d803so2665846b3a.0;
        Mon, 24 Jul 2023 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690216732; x=1690821532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+JfSQRVxp5hBkPI67OByVISWadfjZ/gRo2caZ6QEXQ=;
        b=J0SIDsaBqhOqChaQ67sGyvXCw6wuB9D70BUPePoRqPBHzVABFhup3ZHYXe/SPLDyyp
         9/ZKbm15730MXx32osKl+2CMdJPZ8SsFsfozMhaByvH1NQgWElYdrssXlTtZ4gtshqyT
         3L6kvgvgfgdGpurk0A7WlEOtZBVi1lcM2t27vF3bL3YHNcZ5CnDiwMrEN5CD/PEFOk9S
         GjhujVbNueto7dTUoLwf+AJ8TZ8JiRF3EXzims3/cuKgmFP+7fYzAp4+gGiSEIoBvkPC
         gSKftNJ1d/h6iXs+kdqKiHc25umN+6MR1gGNvDa6B6n6CCDcrNCmGcheSANsj5zk5GXO
         PL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690216732; x=1690821532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+JfSQRVxp5hBkPI67OByVISWadfjZ/gRo2caZ6QEXQ=;
        b=dtGmsTUVajQzD4yXRVl32ZnOz5PyAfu+sJ0nQJTCBwcJmfLlvUa745z2eYHOPrNick
         rbJzDFzKDC8vXHZwKUmGhxEhl2Sco4hDXbG/rjpSVZN9RqzZBneW26jNPPXC4Jq5KSGw
         E+a9656YmfzNgLPCB1TUXq9usAs+Xs8yarieRbEJGCjVjxX07NVdxt4i+39Sunb0anKP
         DgzBey3UDjaCn7Z3Hz5pYArJjAXXeCWdZ7hthKKDpm66dOHhuxxpF99Hx+sNTCpNfXTN
         auGygPH1MDSuTFHRZZKPw+178GrM90hQv1ZD+l+Okfi26mckVR3uc74w255glLb86F9S
         9uxw==
X-Gm-Message-State: ABy/qLbjwMjIxMcjgxAeYjZbT3GE+D+rP3Gj7+bbUQEfEwzR9Sy7Nizx
        gu47+pdDR8VVtAjj70Vx504=
X-Google-Smtp-Source: APBJJlHwkoplxjfTudrcTmCgYQje4SlToJXd/PplWbbrxvDRkCzwmUomoG9bb/7nJz8xzrTc/eq/sw==
X-Received: by 2002:a05:6a00:2492:b0:673:5d1e:6654 with SMTP id c18-20020a056a00249200b006735d1e6654mr10098128pfv.33.1690216732389;
        Mon, 24 Jul 2023 09:38:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8db:3c3:1ff4:2ae3])
        by smtp.gmail.com with ESMTPSA id m26-20020a056a00165a00b00682b2fbd20fsm7996939pfc.31.2023.07.24.09.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:38:52 -0700 (PDT)
Date:   Mon, 24 Jul 2023 09:38:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Message-ID: <ZL6pGRNvOfdYhhAs@google.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
 <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL51/dXKyDkcoDVJ@smile.fi.intel.com>
 <OS0PR01MB592289F163F05A61DFD019DF8602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL6BsM0NGhn2mc+6@smile.fi.intel.com>
 <TYCPR01MB5933A2EC98D3BF251C74A7AF8602A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB5933A2EC98D3BF251C74A7AF8602A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 24, 2023 at 01:58:55PM +0000, Biju Das wrote:
> Hi Andy,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > device_get_match_data() to struct bus_type
> > 
> > On Mon, Jul 24, 2023 at 01:19:02PM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > > device_get_match_data() to struct bus_type On Mon, Jul 24, 2023 at
> > > > 12:02:27PM +0000, Biju Das wrote:
> > > > > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > > > > device_get_match_data() to struct bus_type On Sun, Jul 23, 2023
> > > > > > at 09:37:20AM +0100, Biju Das wrote:
> > 
> > ...
> > 
> > > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > >
> > > > > > You can't just throw one's SoB tag without clear understanding
> > > > > > what's going on here (either wrong authorship or missing
> > > > > > Co-developed-by or...?).
> > > > >
> > > > > Dmitry feels instead of having separate bus based match_data()
> > > > > like i2c_get_match_data[2] and spi_get_device_match_data[3], it is
> > > > > better to have a generic approach like a single API
> > > > > device_get_match_data() for getting match_data for OF/ACPI/I2C/SPI
> > tables.
> > > > >
> > > > > So, he came with a proposal and shared some code here[1].
> > > >
> > > > Yes, I'm pretty much following the discussion.
> > > >
> > > > > Since,I have send this patch, I put my signed -off.
> > > >
> > > > I'm not talking about this. There is no evidence that Dmitry gives
> > > > you any approval to use or clear SoB tag. Again, you may not do like
> > this.
> > >
> > > Here Dmitry is acknowledging, he is ok with the patch I posted.
> > >
> > 
> > No, you just misinterpreted his message.
> > 
> 
> Dmitry,
> 
> As you are the author of code, either you post a patch or provide your SoB as per the guideline mentioned here to avoid confusion.
> 
>  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

It was not really proper patch, consider it as an email with parts
written in unified diff, as sometimes it is easier than to explain in
words, and I do not want to take much credit for it.

If you wish you can put "Suggested-by" for me, or just drop my name off
the patch description altogether.

Thanks.

-- 
Dmitry
