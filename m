Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61AD6C9F2D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 11:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbjC0JQ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 05:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbjC0JQ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 05:16:26 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDB34239
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 02:16:24 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id l14so5124366pfc.11
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679908584;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgMR0rh/4y7PUWkgjC5D1ZLTIu4Xe0fvcNc/5RhdQ/Y=;
        b=Tf3VlODMFHBHv+1/ruZ9mzU/s9xIJ5lj6UCtpOOF778BZ/hXE+m/y0NHp81l/I16wo
         oSAK6z22iwfXLjtc9TRRJQVTiDcM6BXDptxMtOy6Ke/gCW6MxAfjBv0eShsgq3aKheLz
         0IcqfsS5oquDJ/S5Zl2Bv2yNsNxhCMu7FKhS/TiZeEJkZXZhi18Fg0K/aX19BKYKUgcf
         ucN3OHRwIIbMbw3Em0Zo7WY27nut/4i3Jf+oFVg4mBSNl/fpwfEvy/Bn63oSpMtC29fI
         QEu02R6/UIVLj8wRit6d3xl3MGuI/+uxUxAJ91/OHRcIZP660R5XrQGJI95AL67XZPH/
         St+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679908584;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgMR0rh/4y7PUWkgjC5D1ZLTIu4Xe0fvcNc/5RhdQ/Y=;
        b=RwPpHG/YcFm2ID2FGoGuEuiPMaUnF/4P4zLA+lbgN0GmqcF0nK6dXYxOen46G7CXKE
         f3gmsrNKornzQ6Ua9XBGdplyYFixoGBbzJGm9mmp0cBEzaKMraaDypXnrMquG0FnNmkS
         sKW/CYM7q8/iJoQbbquk716k6kasxwNTBjQMebqSMRWU4b7/FghFmmtVRGbqbgnVs17v
         5Z1cnPToFlfhF1BqTLqBcju2FAL2ocpHkDkrTrHPHF7hJCRW0p5gwt5EWNLfwQHaoQVc
         som6fv/ZXX6LtbBZC3ztO7FAQDyUviDiS7Xud1XTZa3q8gskuXpepoxkwGsHjjvkeH1m
         4C1Q==
X-Gm-Message-State: AAQBX9e55e71yNPQAVdkVmeIk3pR0eG6PnLG05BVVY4fa6B8/F5gsttF
        Sb4RCrU3NW0m/R43whd2WcEBYXuGL9QjyD/UtLk=
X-Google-Smtp-Source: AKy350b+2BjvoaB0h1h5RqdVuPNI4IheZ03EvkSuB5OrSam0bFfwHf6zKvERWVTVaMsqRMllge4H6b00STs3LUq8pUY=
X-Received: by 2002:a05:6a00:2d27:b0:627:e677:bc54 with SMTP id
 fa39-20020a056a002d2700b00627e677bc54mr5637021pfb.5.1679908583864; Mon, 27
 Mar 2023 02:16:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:3db:b0:9f:d19a:fd79 with HTTP; Mon, 27 Mar 2023
 02:16:23 -0700 (PDT)
Reply-To: annamalgorzata587@gmail.com
From:   "Leszczynska Anna Malgorzata." <mrsstewartprisca@gmail.com>
Date:   Mon, 27 Mar 2023 02:16:23 -0700
Message-ID: <CAFoYun0pOf7h6MXemKOxx_VJ9qat6_H9Si4pXTKnow3m+j_=JA@mail.gmail.com>
Subject: Mrs. Leszczynska Anna Malgorzata.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_5_NEW,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:433 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsstewartprisca[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [annamalgorzata587[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.8 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
I am Mrs. Leszczynska Anna Malgorzatafrom Germany . Presently admitted
 in one of the hospitals here in Ivory Coast.

I and my late husband do not have any child that is why I am donating
this money to you having known my condition that I will join my late
husband soonest.

I wish to donate towards education and the less privileged I ask for
your assistance. I am suffering from colon cancer I have some few
weeks to live according to my doctor.

The money should be used for this purpose.
Motherless babies
Children orphaned by aids.
Destitute children
Widows and Widowers.
Children who cannot afford education.

My husband stressed the importance of education and the less
privileged I feel that this is what he would have wanted me to do with
the money that he left for charity.

These services bring so much joy to the kids. Together we are
transforming lives and building brighter futures - but without you, it
just would not be possible.

Sincerely,

Mrs. Leszczynska Anna Malgorzata.
