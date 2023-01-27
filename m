Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B894067E649
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 14:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbjA0NNG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 08:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbjA0NMy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 08:12:54 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CA380F95
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 05:12:23 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id me3so13581415ejb.7
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 05:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pu1HTphj/Rd+hvsmfPEOQ6MqsGz846VOWoOD9sOistQ=;
        b=W/E5rIznkAUn0gpNPXRTLyh4NVlL5sSBE3DMefgPKKEJfF0sP62XHai51Ky8UKJRup
         1Jo++Y1Q0N42fbS71zOEpwOtEqWOEvD6MMGiJ+iSsoPzGDDKjVZaENephTqcMrOP1kUV
         DqRUr2ZjY2EUpzh1DYsi/pruy7lsyBCvEIK1ooaOtVj3qqxvzCiKUtc6JD9vf6ZE/x2x
         sPU8+qKbIug0hwUnydlz0bpv9dHu/kFyoQPYcVfoHqAN2sIOl0hYQUP1jdxD+It6lNOQ
         mcUvvhPP4zOHAkmN7tqCV3TAb78hvVzJ92I9EuwDrEK6C9/LZFpN4HeF5dFkHq1dG82r
         fYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pu1HTphj/Rd+hvsmfPEOQ6MqsGz846VOWoOD9sOistQ=;
        b=MECoR4inOYKCmhF0WavFTnAUoGNpU+FqkP7rUcPj4UeMJowdGwMFQYJUgW029bjZBU
         NLd49oiuqTgV8xwdaV6offpUMg3geltkSwGc3VFt22xfTFoaTTLaKDTLLCwGH/BFGwVU
         jrItlf8h03b02gCBD+4mBVug1tKDagtJXsVHSVz3nSEuVROtiiqRYWvrMxvN/ZrR4+Kt
         mOROO6qV3IzeQTLCxn3oe9O5vtGn5D6JzF7xI0VQ32kJGPVEv9PRWvn1vlixSVUeWRTA
         Sn/BYnqMwveCAWwY5QSszxMFPAdXUADVR0rbNY8OE25YUkxI/NypVMinp/3N2J23nxrT
         VARA==
X-Gm-Message-State: AFqh2kr9pSrnCmyg6xg/FISYMZNvmHitPHawfSgPcRKAkXGwwQei9yAF
        pAKsfNZwhnzALgc2ArnTTeRFhw==
X-Google-Smtp-Source: AMrXdXtSn4UtqYZrwl5P+2ddPBf9wah+lahWSRiqA6L8PTwwWCdsQoRkV9HoNaXhwa8nKtrN4I01bw==
X-Received: by 2002:a17:906:b806:b0:84d:430a:5e63 with SMTP id dv6-20020a170906b80600b0084d430a5e63mr39507156ejb.27.1674825091449;
        Fri, 27 Jan 2023 05:11:31 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id n5-20020a1709061d0500b0084d420503a3sm2234999ejh.178.2023.01.27.05.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:11:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 27 Jan 2023 14:11:30 +0100
Message-Id: <CQ2ZY0W1M4F5.32SLTSYMILGOS@otso>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Loic Poulain" <loic.poulain@linaro.org>,
        "Robert Foss" <rfoss@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
 <20221213-sm6350-cci-v2-2-15c2c14c34bb@fairphone.com>
 <e5ff49d4-45c7-8c4a-d624-d8f7cc9ce2cb@linaro.org>
 <CQ0I4ONEI6J4.3KWS1KBE7RTKD@otso>
 <3ae863df-3260-4863-d88f-da4d3f442174@linaro.org>
 <CQ2ZDQKO11XZ.HA5CXLK5MTFB@otso>
 <2989138a-8f4b-50a0-3e90-98b6785f2690@linaro.org>
In-Reply-To: <2989138a-8f4b-50a0-3e90-98b6785f2690@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri Jan 27, 2023 at 1:49 PM CET, Bryan O'Donoghue wrote:
> On 27/01/2023 12:45, Luca Weiss wrote:
> > Can I reference <&camcc TITAN_TOP_GDSC> from itself? I know that having
> > it on is required to turn on at least some clocks (maybe all clocks).
> > But from what I understand how power domains are normally handled, the
> > driver core enables them before the driver is probed, so self
> > referencing wouldn't work.
> >=20
> > And at least no other SoC upstream references TITAN_TOP_GDSC in camcc.
> >=20
> > Regards
> > Luca
>
> Doh I meant to say a power-domain to an mmcx a la
>
> power-domains =3D <&rpmhpd SM8250_MMCX>;
> required-opps =3D <&rpmhpd_opp_low_svs>;
>
> TITAN_TOP should be in your cci and camss dt nodes.

Okay, that makes more sense.

What I don't quite understand is why sm8250 only has MMCX listed there
since downstream has both vdd_mx-supply =3D <&VDD_MX_LEVEL> and
vdd_mm-supply =3D <&VDD_MMCX_LEVEL> and both "supplies" are used for
different clocks using .vdd_class

But back to sm6350, downstream has vdd_mx-supply =3D <&VDD_MX_LEVEL> and
vdd_cx-supply =3D <&VDD_CX_LEVEL> and like sm8250 uses cx and mx for
different clocks.
Not sure if I should add both, and I guess mainline also currently
doesn't use higher ops for the power domain when higher clock rate is
needed, from what I understand?

>
> ---
> bod

