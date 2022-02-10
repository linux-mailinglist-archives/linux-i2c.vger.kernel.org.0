Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A07E4B15B4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 20:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239722AbiBJTCZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 14:02:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238780AbiBJTCZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 14:02:25 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C624310EA
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 11:02:25 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id bs32so5861495qkb.1
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 11:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X5W2pq9dsVXSH/I7PTz4BBp4YweqmzTi8YkXg+g+TkU=;
        b=uL8crpQ0bGH1328AiJjfSG5jp/Pl6DVkUDryFl+phH4/Aak09d28Mh/j3lUAQNgQOe
         fB+TvoO+Aa2xnSvaRYj6LRu87WjoCynhaASfrNq2vyJChD24VbhhfB7Tbl5KJY5biRpU
         zujfE44+Cink3heI/PnMyEsINHliszuwu4Eubz9hXza97cxN0TvyqQWC+HqeSL6FFnBC
         Ej+7nq0O1K+4mjOruaVmgo7F9mGDPt9Pw6ug3SP6O2gvJhNQj1Ic3VmKPZiIgiCkRqkc
         AHsWY0WLmCPGponRxKK1yGV3l0CvmJT+OnP+74054HgttN3NNPLnNFNOtuwZZ6RnV1ju
         wDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X5W2pq9dsVXSH/I7PTz4BBp4YweqmzTi8YkXg+g+TkU=;
        b=C6v7SCNRR8cNY2IrZE2Ovbsgh/7ZZaSmeaKkc7k56Jie9IXCIFIbm6NSgQ/Az/3Spx
         SIKhdu2zMY3d4xoPiycvhKImsR5ASljNVKsuqwYGM1Te3v1W5ApjBBnNNg9yBgrbFOqJ
         JcDYkt7FauSBUkdQdaCJDFCcYdmK1GrSSlw/ZDyvhm3XX9dppogpcFxdTBU1HhiVtEgG
         OH/zIPikRgvTZJjO5M/JQIuVDCiJfkGDFBjUnBdMl5DJzot8Q0/IDYGERHZeOfazTbSV
         4VdndBrae53G3trKvr1e9gFzmZlRqKx5rzA9wHGVERenj3mlZdIVwUI6hZhlEqHN7gPu
         WEKw==
X-Gm-Message-State: AOAM532GUZVRliqqkvswtu6yN1KBuM5SnKDPE2gEsSblTCxI9RgqPPn2
        /V9cvIKfG1oF/HvSf2NQQ6NXQmog1zalfA8MjoVOtQ==
X-Google-Smtp-Source: ABdhPJzioCW22SI5kzLf25TmyIJ1WYvKdK7QUtCX6HADN3OQnkHCy4r6etMQovM7Lqg1ztMH2JdvBX4KMpb75Kh+KR8=
X-Received: by 2002:a05:620a:1664:: with SMTP id d4mr4566853qko.363.1644519744622;
 Thu, 10 Feb 2022 11:02:24 -0800 (PST)
MIME-Version: 1.0
References: <Yf1/X1rXm4QbyoFN@sirena.org.uk> <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
 <YgEvN0lXXu4lDCN5@sirena.org.uk> <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
 <YgJoX+Ajgt4dweQJ@sirena.org.uk> <CAA8EJppEjFqPUBXtdkTsx2U2CjsrjNsXEmrx_DkAS9a9jmB9cg@mail.gmail.com>
 <YgUy9KMXocSqnv7b@sirena.org.uk> <CAA8EJpqN_T7eAOdLhK-P_0HCuChpE9JhPBg9HVJ=N1kKMbgDjA@mail.gmail.com>
 <YgVNJHTQufLu1sM5@sirena.org.uk> <CAA8EJprrhame0zG4=4cFF7PBS0c9synjStLBingk58y7EJfV6w@mail.gmail.com>
 <YgVY6t4OknBR6ySW@sirena.org.uk>
In-Reply-To: <YgVY6t4OknBR6ySW@sirena.org.uk>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 10 Feb 2022 22:02:13 +0300
Message-ID: <CAA8EJpoguQGezeLBYyNkGmnnXkFOfQ4OvsToQqPO_0QO87S2SQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
To:     Mark Brown <broonie@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 10 Feb 2022 at 21:26, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Feb 10, 2022 at 09:21:42PM +0300, Dmitry Baryshkov wrote:
>
> > I'd second a request to handle the adapter->bus_regulator in the core code.
> > Would you be ok with the 'external-sda-scl-supply' property? Would you
> > demand that it's completely handled by the core layer (including DT
> > parsing) or should we let a driver parse the DT property?
>
> I'm not super worried about how it's implemented so long as the binding
> is good for the long term - if doing it in a driver helps get things
> done that's fixable later on without breaking ABI.

So, 'external-sda-scl-supply'?



-- 
With best wishes
Dmitry
