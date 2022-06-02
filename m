Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8805253B91A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jun 2022 14:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbiFBMtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jun 2022 08:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbiFBMtN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jun 2022 08:49:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A6E8CB3A
        for <linux-i2c@vger.kernel.org>; Thu,  2 Jun 2022 05:49:12 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id c2so6123886edf.5
        for <linux-i2c@vger.kernel.org>; Thu, 02 Jun 2022 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=93IUvByvbQ5Fw18jKg+mGDXYGbF6YTatIAwjc4Egg2A=;
        b=a1cKEEUeLVVZhIFeNtYIFJk5GIunL4U7wSWTFxm2TPVBo/oztywofqxgM4pwQ6D/vN
         VjdJkJkDD1TMcHim6A/ZLeZfYeZiMK98AXx2nLTVh+xAcxdWGB2XqLbbmyIGWYnksRFR
         0U1IzOyOLrAoun+S9MIsvIJ6FArAZ6YMV9t3ky5TU16V9eNKpFJiHymHPSFRytLcqa7x
         dSyiHYCamFEQBS3TK0c2fpzj7QBw7Wdq0QWrFPag0N9O5B5pE1dnh0v0L69yfX79u5h8
         0wCD56tjlBQxD2lUm+fkfyUvHlYxmEAlwEcHfpfey8ViQsl47nR9AgGrZIYL1gludBAP
         1YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=93IUvByvbQ5Fw18jKg+mGDXYGbF6YTatIAwjc4Egg2A=;
        b=byQQA3LWAbi2ui3i3QBkPgry1glY2/ci4BhHYDKHuXyz8X++67GPby9TZFGJH7MdZn
         oMbyhhxckZzWqo4+S8Y60LpB4PmsiJoOnfEoO0FecCQP66k86E7ycogsaEFEMayiQZNM
         We2ByxMmWzt5N6p3uuBOfMFNmVqmYFNJgC1ZK6uqzGMcpfibtiGlh8TlmSpUznB6qHQL
         B/jDpx4UrdXyNIKLfS+xE+exQJLPrH9QXgxyZcbMYg8enfDZcPxwMRZa6Mxb447oH7PV
         fIEhCAFqt9hB3gbeeyNTAf445Fq0i/DGkNu2n/UVu481mOqtlg4oSPTJcFSAIQ50nMbm
         eUKA==
X-Gm-Message-State: AOAM531MyPHN+gcGab7muOGiVMOpvJNJcqHfnGbX4ZQnDrVCDSJ7RWVS
        c0ry1KUOEwXXazrOF0SIgQq7A0WP7PwjjsZxZXQ=
X-Google-Smtp-Source: ABdhPJweO/FKnUQFBgrU2HoMhcimsV3yq890lA1uQOtscS9FtunMRPp9f18TXNQ+rZ62VCYTnNYF1lKzmjurF/zB3kk=
X-Received: by 2002:a05:6402:414f:b0:42d:915f:a48a with SMTP id
 x15-20020a056402414f00b0042d915fa48amr5317198eda.396.1654174150704; Thu, 02
 Jun 2022 05:49:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:2546:0:0:0:0:0 with HTTP; Thu, 2 Jun 2022 05:49:10 -0700 (PDT)
Reply-To: thomasjoyec@yahoo.com
From:   Joyce Thomas <missagathaumuamumam@gmail.com>
Date:   Thu, 2 Jun 2022 05:49:10 -0700
Message-ID: <CAJ=ktsLx+s3Uq43aGA-7dRAZfnUJAmUdO1d48v+XW63Fb09-CA@mail.gmail.com>
Subject: Hello Dear Complement of the season
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Dearest one,
Good day to you today and how are you.doing I hope all is well with
you; please did you receive the mail I sent to you since three days
ago?  Please can you be kindly get back to me  so that I will  know if
you received the mail I sent to you or not.
Best Regards,
Ms Joyce Thomas
