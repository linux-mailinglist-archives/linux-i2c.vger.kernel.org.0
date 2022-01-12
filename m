Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EA348C2A7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 11:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352672AbiALK7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 05:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352670AbiALK7I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 05:59:08 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD2CC061756
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jan 2022 02:59:08 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id r16so1939988ile.8
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jan 2022 02:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MfwR9+Vn3jORLxr1DCzz5sw91FiMcAgXShlKPQP07jQ=;
        b=NDZBc/s1vAw8tQA5LjF31oTBrFLLcmW+F8lIL8mO9e1iiuzWvOVpkL1c9Uw3JvgGgQ
         lW01tlg/wfoycDe2ykWw52j01N7BRgIUTZHpPrdDmepvuZAUmpkG0YQzkRmb9mbMAOVa
         27N6dOP70T+yPfhseSXJ33v4jkRK9JoRgIEx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MfwR9+Vn3jORLxr1DCzz5sw91FiMcAgXShlKPQP07jQ=;
        b=kSLDxvn5g3rHTqUg6eyKcdtT/TpI8pn5/78dtMjvg3w8pv/2+ngBHNSnLTfwT2UX6o
         t5LkUxOx82QGT8K477/DzbsD9BcPXuk3oUovhK/qmGTszeFqkgYKnogq5XB8kGcy7Kyp
         mwyhAKoO0m8mvQrWIxLBUebsvzdSJp2wDeTYLmdTBW39wUwRwfGK7tobEowf4HBDpPK4
         ZZ/23fGRunVXAHTNXzsekZ7wsgQ07zNPA8hHRDHSmbDzk6DbvBtcoIw9ARX/2c6iMgGr
         C756JtokpGz8N80uFAWb440N7nZvWFl2Uwx7tnANYBoz0RAo/hxENvv1Smf5J2jSgWkR
         pXqg==
X-Gm-Message-State: AOAM530sJFbURgsDvm4GHleYT7x9DW5yljyDMPwvLXywLKi8WZZYHfyO
        DtMRVAnZHvNeNQ7DFD0bA0f0MOqGzLg7GYWWV8Wc1g==
X-Google-Smtp-Source: ABdhPJxMD3Payzn92jPXXv9nrRvXDf6eBuPX2VU3t1MbasTCzgSWT0uLtDReSbroas9QGt1LuRqwsjrJcGI2QNNuxqE=
X-Received: by 2002:a05:6e02:1c27:: with SMTP id m7mr4511705ilh.114.1641985147116;
 Wed, 12 Jan 2022 02:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20220106122452.18719-1-wsa@kernel.org> <Yd6gRR0jtqhRLwtB@ninjato>
 <98ed8d6d16a3d472d9432eb169aa2da44b66b5cc.camel@yandex.ru> <4dfbee97-14c2-718b-9cbd-fdeeace96f59@yahoo.com>
In-Reply-To: <4dfbee97-14c2-718b-9cbd-fdeeace96f59@yahoo.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Wed, 12 Jan 2022 18:58:41 +0800
Message-ID: <CAJMQK-h38XdN=QD6ozVNk+wxmpp1DKj21pkFZ+kY31+Lb8ot6Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "i2c: core: support bus regulator controlling in adapter"
To:     Tareque Md Hanif <tarequemd.hanif@yahoo.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

hi Konstantin and Tareque,

Can you help provide logs if we apply
5a7b95fb993ec399c8a685552aa6a8fc995c40bd but revert
8d35a2596164c1c9d34d4656fd42b445cd1e247f?

Thanks

On Wed, Jan 12, 2022 at 6:02 PM Tareque Md Hanif
<tarequemd.hanif@yahoo.com> wrote:
>
>
> On 1/12/22 15:51, Wolfram Sang wrote:
> > would the reporters of the
> > regression be available for further testing?
> Sure. I am available.
