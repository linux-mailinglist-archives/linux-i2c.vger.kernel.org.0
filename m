Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94FC7DCD89
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 14:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344434AbjJaNGW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 09:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344366AbjJaNGW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 09:06:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA75B7;
        Tue, 31 Oct 2023 06:06:19 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5079f6efd64so7853189e87.2;
        Tue, 31 Oct 2023 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698757577; x=1699362377; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7TOHNs65qPKtU6ThEfManwQj7h8MWbM+5voq+rsVsH4=;
        b=YENyoSj0gg49Ugfc5fx/anXvu1/adLgkFnpSVDEVxfS6ZXEYXMKFMG3NmbxJArsXmW
         xlCHadKXFlX/q0IUVS6g+CcWjAum+uo0IKlHbukEsq2tyh0TLdeT65OX6voBWbgQP6oU
         EW6GkqljqjzTfj7jxR0N1qN5vgE15UyFLYm+1OwBgxOmtlzrt2WEthgxPNdr+KI79Zm4
         BFJMpEtVuLtQnWtoDnq9uj8aDS8RxCIMaE3ka+t+CP6q9oLdNYAZhuloTY0U/J4Mdkcz
         I/ONBH53oc0idB3v0Esur+Je+MeHwPD8PYmQK6gUImuTG9qoOeNNV+9qWNHWiJ6hfhN5
         vAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698757577; x=1699362377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TOHNs65qPKtU6ThEfManwQj7h8MWbM+5voq+rsVsH4=;
        b=JM25O8t98BFFbAkaXpp8afs1yj0T32Z0rOPzUQFe/IMcexPwh8GSPqTXkTvyQmDoFw
         TYtk5lGQ/9Cw0TkdN742oRTMZfOmnrzx/AWkHwQAdqmtPuwoR7vmbT1ub7GaJhl3adBo
         v0pibiw5PG21xE++gHx0swxPcoz7AlbXJ3laXLjmMd+vYTguj6YGl5Ang3ZcpRYBOx0d
         rt4/6d6oIErd/DVQKHmeiCioTe+6h8coHyVYJcrB7IyVLo/qE57YTHBVZ22VGnm0AE/B
         I6cPu0fDNu41FO1zH4LQomj1rYGadaSMQMrzjS0wCHxLO0RMAH2Xbvx0jwMMw4F5mhk7
         PAnA==
X-Gm-Message-State: AOJu0YzIi0Wp5Een6jxBDOYF7XMMR4qUXIm2H1bWyGR4bGZ7XK9dSw1S
        NCkIdktcrHQ2gNyR6y/T8PQ=
X-Google-Smtp-Source: AGHT+IEu21+OF00j/lGSfTSHwS4rQXTG+cqiBZN+j2ylEmA0bTQSE9seV91in8mpJoWagpFxu7ormg==
X-Received: by 2002:a05:6512:ad5:b0:509:11fa:a208 with SMTP id n21-20020a0565120ad500b0050911faa208mr8137724lfu.43.1698757577302;
        Tue, 31 Oct 2023 06:06:17 -0700 (PDT)
Received: from mobilestation (srv1.baikalchip.ru. [87.245.175.227])
        by smtp.gmail.com with ESMTPSA id d22-20020a196b16000000b0050915816a03sm205438lfa.86.2023.10.31.06.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 06:06:16 -0700 (PDT)
Date:   Tue, 31 Oct 2023 16:06:14 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Yann Sionneau <yann@sionneau.net>,
        Wolfram Sang <wsa@kernel.org>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Julian Vetter <jvetter@kalrayinc.com>,
        Jonathan Borne <jborne@kalray.eu>
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <wlhhgjsh7hw76m637zpj6c4fmzsd2znphrb3dujen5ieukdbwr@yantuxgq3yb7>
References: <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
 <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
 <ZTpLHZZYtd1WgBu6@ninjato>
 <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
 <7ee0acbd-e332-4dc5-a6e6-0df58913ff71@sionneau.net>
 <846d933a-598f-43e7-8478-04f3a0d20d1c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <846d933a-598f-43e7-8478-04f3a0d20d1c@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 31, 2023 at 02:10:13PM +0200, Jarkko Nikula wrote:
> On 10/31/23 10:44, Yann Sionneau wrote:
> > 
> > Le 31/10/2023 à 01:12, Jan Bottorff a écrit :
> > > On 10/26/2023 4:18 AM, Wolfram Sang wrote:
> > > > So, someone wants to come up with a patch to move to non-relaxed io
> > > > accessors?
> > > > 
> > > Is the current thinking to just make writes to DW_IC_INTR_MASK use
> > > the non-relaxed variant or something more broad?
> > > 
> > > From a safest functioning viewpoint, we talked about making all
> > > accessors default to non-relaxed variants. A couple of pretty good
> > > arguments from knowledgeable people favored this. I know there also
> > > was some concerns about potential performance impact this might have
> > > although the counter argument was this is a pretty low speed device
> > > so some extra cpu cycles on register accesses were not likely to
> > > degrade overall performance.
> > > 
> > > I could make the patch if we have consensus (or maintainers
> > > decision) on which way to go: 1) only writes to DW_IC_INTR_MASK are
> > > non-relaxed, 2) make all read/write accessors use the non-relaxed
> > > version.
> > > 
> > > I'm personally in camp #2, safety first, performance fine tuning
> > > later if needed. Latent missing barrier bugs are difficult and time
> > > consuming to find.
> > 
> > Fine with me, let's go for #2 :)
> > 
> Also simplicity votes for #2.

+1 for the option #2. Let's do it and be finally over with this
patch.)

-Serge(y)
