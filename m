Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2EF75FC44
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 18:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjGXQfI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 12:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjGXQfD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 12:35:03 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E434B10F7;
        Mon, 24 Jul 2023 09:34:57 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-66c729f5618so4333056b3a.1;
        Mon, 24 Jul 2023 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690216497; x=1690821297;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPY+/PnhzHFtPt0tZQtYeNyQhNC/v7QsezINAIEv2aI=;
        b=D3RR8FBeuYcqNYn7VTTb6rILtuEnSSxZ4jFPnys6XSMbXbEIrZoZoqHN0kfq497ToV
         Wg0OJ2cPE0qoWHuzJNOJVnnrhysKv12+IiqDF7X2wUaCfuLKb8vbvBrN4bGhz2pWiQMC
         Wx+knLXOYHFv+gv8zp0H7HW7bauqyd+OdNCqUjT4i5GYGnChZazleoZgFz90r4I0mY+T
         sahwsZdgRsx2cQhu9IMdpsJaGdyVdqzlNp5pcDRx4HPuWpgOwFyle14dE9PCaqytQK34
         WdS7bz50xnvZDUc2EKEI10WmgcMuTe+Izmdln4nJTJX4+6ty3LWLbYzKrDLFZ/L05720
         jqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690216497; x=1690821297;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPY+/PnhzHFtPt0tZQtYeNyQhNC/v7QsezINAIEv2aI=;
        b=GKoYQ7GaXCAui8wOX8BdfmdWnz7uVO3W6DvKWx6YRU1M/UGexIwHSXPc8zUgAaDo3D
         QDjELlgt7i8Jo3wHVnckRjK+JWkn3C90VjAcfOUuzWxKCB31VDcyoFmDkoDUyNafpK8Q
         rJ1xQW0n8Y5PdHiTm5e6q6EkTAFikA3G4mHUKANZLbeeZxwnFY3OMU/ruliznVH6nYuy
         LhXjO1SZFS2+y6Tjzc4PdoJqH5pMC22orloG9ucs7UoSzMvzvr+1wNTQfp8b1Okbjmno
         zm3g+Y4F1WJZQSu4msfVC1bxb+0kLzVGzKdajA8d3hWIksrsc155RqdFYfhIu5i/FkGQ
         I4Yg==
X-Gm-Message-State: ABy/qLYQyt+TVLYxVt3RRs5+avgnQY2DnJdkZN5DQGzhKIP2AevhzipX
        T7wkaopZfwUiQyTQWd0UpvTFRS8fJFk=
X-Google-Smtp-Source: APBJJlEyGoQb0ncKRYtNc/D/eu+jVEwZVJD8O6CLTgykkkb4D81Iqzc2iwjuhNd91ZqzzmxQksaaIw==
X-Received: by 2002:a05:6a20:bb07:b0:132:a85f:b20c with SMTP id fc7-20020a056a20bb0700b00132a85fb20cmr11315169pzb.38.1690216497060;
        Mon, 24 Jul 2023 09:34:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8db:3c3:1ff4:2ae3])
        by smtp.gmail.com with ESMTPSA id d6-20020a170902b70600b001b016313b1dsm9111179pls.86.2023.07.24.09.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:34:56 -0700 (PDT)
Date:   Mon, 24 Jul 2023 09:34:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZL6oLoPviI8ZtSKV@google.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWThYuw+fwoz8xwHRyDDgTQUkW_c_ANkjzuMggqZCm3zg@mail.gmail.com>
 <OS0PR01MB5922CA1B457D6747478DCCB18602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB5922CA1B457D6747478DCCB18602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 24, 2023 at 03:06:50PM +0000, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data()
> > callback
> > 
> > Hi Biju,
> > 
> > On Sun, Jul 23, 2023 at 10:37 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add i2c_device_get_match_data() callback to struct bus_type().
> > >
> > > While at it, introduced i2c_get_match_data_helper() to avoid code
> > > duplication with i2c_get_match_data().
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/i2c/i2c-core-base.c
> > > +++ b/drivers/i2c/i2c-core-base.c
> > > @@ -114,20 +114,41 @@ const struct i2c_device_id *i2c_match_id(const
> > > struct i2c_device_id *id,  }  EXPORT_SYMBOL_GPL(i2c_match_id);
> > >
> > > +static void *i2c_get_match_data_helper(struct i2c_driver *driver,
> > 
> > static const void *
> 
> I missed this.
> 
> > 
> > > +                                      const struct i2c_client
> > > +*client) {
> > > +       const struct i2c_device_id *match;
> > > +
> > > +       match = i2c_match_id(driver->id_table, client);
> > > +       if (!match)
> > > +               return NULL;
> > > +
> > > +       return (const void *)match->driver_data;
> > 
> > I guess your compiler didn't complain about the const/non-const
> > conversion when returning because it inlined the function?
> 
> It complained. Somehow, I didn't notice that warning before sending the patch.
> 
> > 
> > > +}
> > > +
> > > +static const void *i2c_device_get_match_data(const struct device
> > > +*dev) {
> > > +       const struct i2c_client *client = to_i2c_client(dev);
> 
> Not sure, non-const i2c_verify_client(dev)to be used here??

Good call, it actually should, as i2c bus contains instances of both
i2c_client and i2c_adapter.

Unfortunately i2c_verify_client() right now is a function, we might need
to turn it into a macro to allow transparently handle const/non-const
device argument... If this is too hard at the moment we could open-code
i2c_verify_client() in i2c_device_get_match_data() and first check on
the device type before doing to_i2c_client() conversion.

Also I see i2c_device_remove() uses to_i2c_client(). I guess it only
works because i2c adapters never have drivers assigned to them, but it
would be nice to use i2c_verify_client() and maybe put a big fat warning
if we get wrong type of device there.

Thanks.

-- 
Dmitry
