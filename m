Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB956029C3
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 13:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiJRLBs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 07:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiJRLBs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 07:01:48 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CCEB5FDF
        for <linux-i2c@vger.kernel.org>; Tue, 18 Oct 2022 04:01:47 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w196so15115541oiw.8
        for <linux-i2c@vger.kernel.org>; Tue, 18 Oct 2022 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFJSQ0zaQ2g0NS9vBKtihAVAzs7aIC2BcVWQMwbn+5Y=;
        b=GjCV4bo6Jv5R68bQ2vor5m4II4TP6GqJOYnW5HOgiBANNqpP0jAQhAw6y7RBYht5Wn
         +YEYv8fWFMMjAxMnXzqGsK0tqnhLokYW5qj/LISEb8AUuIQKYr2RC2Xuryoon6g84U3+
         WKc1JIn8vbtBVNxgYN2FoFVm9qlAFLtTnnOAxxIqGVXlL1NmAY7xJkQA1oMDe2xKqsYY
         HJdNe6jNQy2qDhjcPdqyFDEGod1zC/YH56krDmgb54vRxML07xfkJ3ENkSn//HNJtahL
         S2SYYuSwyshAsfmys+Bg0bP3jg2kskbL1kuTiUjkwBKkFB/mDdHd56fYsxI6c87rSUN4
         tmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFJSQ0zaQ2g0NS9vBKtihAVAzs7aIC2BcVWQMwbn+5Y=;
        b=drQ87f/XJlR73CAHeMm88xdOJfCpjzM3qNSjsIFQxSsGUFl4q8VKrj8YZVHQONMTVW
         SfHn6IcfEpj1d+TS8ZNXm3LAs9NUjcCVJ2Jxzr/ZTk2B5LM1nxxDTaxAGv8mNqxhcv0l
         oEfycMNwfwRh5PIUUOi0Zf0AZEkrohNL7mxlVXzZU9MR7Ez/xtKbirhmcLnA4QfFPDnh
         SGJTc1pXByd2GWdqTKKK5ckgOwOKEd/oqokchJSwOqetN0u65deH/+HZEH0rxAH1Z2Ur
         K78iAb4fYTSMjAKJGv2N8t8ptjctgL7/CzbR10XRKPG4fIpt07/dKHnJMT/lrsn24zil
         XY6Q==
X-Gm-Message-State: ACrzQf3SPgN3JXCFIQBvHh19WCjSOTwE6fcQMsCBMLuAwpud1A6eRuVr
        4f/RGlMBHKr3pQ3cQzp7MD4fj/mEPKEK//Hgfjo=
X-Google-Smtp-Source: AMsMyM6yRqvg1rvSaY8nTC5aVB5E3JO+jhXra+kbyWREsJzvrbhN3gGtXk5L9yvD3r/DTjr9PaAg2OeHKaDrLwYiN+Q=
X-Received: by 2002:a05:6808:2190:b0:355:4d53:eb07 with SMTP id
 be16-20020a056808219000b003554d53eb07mr1522938oib.127.1666090906552; Tue, 18
 Oct 2022 04:01:46 -0700 (PDT)
MIME-Version: 1.0
From:   Randy Smith <www.techbusinessdatasolutions@gmail.com>
Date:   Tue, 18 Oct 2022 06:01:35 -0500
Message-ID: <CAN+x3vw+20Uv681rp9t9_nBz63v+-c2hsUrOuk65VwWwNSD34A@mail.gmail.com>
Subject: RE: Registered Money20/20 Attendees Data Lists 2022
To:     Randy Smith <www.techbusinessdatasolutions@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

 I hope you are right person to discuss about Money20/20 Attendees Databank=
?

 List Includes:- Org-Name, First Name Last Name, Contact Job Title,
Verified Email Address, Website URL, Mailing Address, Phone Number,
Fax Number, Industry and many more=E2=80=A6

Number of Contacts : 11,753  Verified Contacts.
Cost                          :$1,532

 Interested? Email me Back, I would love to provide more information
on the list.

Kind Regards,
Randy Smith
Marketing Coordinator

 To unsubscribe kindly reply with "Leave Out" in the subject line.
