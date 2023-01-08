Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 621356614C0
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jan 2023 12:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjAHL3p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Jan 2023 06:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233196AbjAHL3m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Jan 2023 06:29:42 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23366D2D0
        for <linux-i2c@vger.kernel.org>; Sun,  8 Jan 2023 03:29:41 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id lc27so4217340ejc.1
        for <linux-i2c@vger.kernel.org>; Sun, 08 Jan 2023 03:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcpM41K3Tg/Gq2Sy2fOw39ukTQf5X/VzmfsS+yU67xU=;
        b=qKooUu0cR0Q6Kb35Lml+i1nctcRKDXBFIEuTWecR2oAg5gpt8iWCWrVTzR/d0ltIz+
         N3v4mI+Id5n22IQcOsRNrs3LfLqdT/HvxkxuThnBBMHey7FRBoM71zAIiDMTHnSgpN5Z
         x3kiNifkBHa67aksnuVhN0ViIH4omkoEA1V/MRsaIxBjjHuMlU8Etutr9d/g3k0VBqS+
         Gvcs1w6Oyb+6hjEoSfAoX0iu6yv8bOv93HJHe2b0EXqway2L9PMP8z4v5codhy5CVb8Z
         gUWDwMgHqJCe7GMUzyDwpcS2znrsiSd/kh+kobYvXrnptX2TmVNEgI44vAZpnc1lh6J9
         XwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcpM41K3Tg/Gq2Sy2fOw39ukTQf5X/VzmfsS+yU67xU=;
        b=XK9JJcbgMpVA/Biqc3rRL8uwpXE28tSm48ta42d6K2lRC9P6gnLrEwIvk7ohrySR9r
         JFT8VOLhWeiwa1PyYwJAYKnUHedQjRcT8VLSzK1qvkthjbHZiAwatbBTNduPXqP1AsXc
         eYomiiymO272HwNC+qRlosHraRIl/2+39qUm7JEClyTn4LXk4gyK0gbhNUtKemftg8X9
         6XUXE0TXcLp1jM6u+bxDm3A2T/B5Xt7tvHbpXZWbP9Nk2Bo+SkbGrzFOKW3npRusQGWT
         DL/tojNdJdHO7wj1D/9am3ZykgDE+MhtonRx0HmwZRs5dow0YTSN8JNgn7R9ZmJkiHlC
         R9vw==
X-Gm-Message-State: AFqh2kp1lqcqYjfUmsLp7UNYl97BXCaTuiv2ewBa/g7/7G+K6sODqWL2
        4VRBeMaLcKn4ZRPVZo5HSVSzgD08DDDarlNOeBI=
X-Google-Smtp-Source: AMrXdXv8qNP079N8Ljgdg1YxgYDV453aDSNxK9LIR74YsJCiaWn938eOuW+3voCWEBes5so6o/csZ9cDSEO/Bl+oL2k=
X-Received: by 2002:a17:906:8381:b0:7c1:57e7:e45a with SMTP id
 p1-20020a170906838100b007c157e7e45amr3219427ejx.548.1673177379128; Sun, 08
 Jan 2023 03:29:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:eca7:b0:7c0:dfb2:c37b with HTTP; Sun, 8 Jan 2023
 03:29:38 -0800 (PST)
Reply-To: muhammadabdulrahma999@gmail.com
From:   muhammad <nnannacollins2019@gmail.com>
Date:   Sun, 8 Jan 2023 03:29:38 -0800
Message-ID: <CAPQqOC03wuphQb6NMCpfv7tZrur=MdFAiO_zctdzRwH0PfHa1Q@mail.gmail.com>
Subject: Re:Re:Inquiry about your products.!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:641 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5129]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [nnannacollins2019[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [nnannacollins2019[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [muhammadabdulrahma999[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Sir/Madam,

An open Tender for the supply of your company products to (Doha,
Qatar). Urgently furnish us in full details about the standard of your
product. We will appreciate it more if you give us with Details:
Specification and Catalogs or Price list via Email.To avoid making a
wrong choice of products before placing an order for it.

Terms of payment:An upfront payment of 80% (T/T) will be made to your
account for production,While 20% will be paid before shipment.

Thanks and Regards
