Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6CE4607542
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 12:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiJUKnW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 06:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiJUKnT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 06:43:19 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548E02608DE
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 03:43:14 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a3so4342586wrt.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 03:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=idi7jPK27aOQx+iUR6FrE1JXHV4RboCem2PMCjpX5oA=;
        b=I2iQ+wBGOV5CtNEG+KhPkrQIzj7LNvQr7fBBqFKYBdijtK5PgNdpw6O3WBwVY4uJMH
         Cr4RMiApLuUIy2ePwyA/fsl9SfXoitgP8WPu3pydmLie6H5+Ne4551CG+OFVBwxDnT6z
         YjAgd7lF6YVrXpxc7GAgnHtqgP/fRu4dnFEmIUigJtBLAuiDMNjPhVo9qLvi5J6bjO1T
         b6ts/gzoSfS6Q+Ak5+/yw6+rs+Vhtv45YAFpIWKIBqp+hbtK2wNFJOyvtTbeuLQ3j8q5
         Fq+Uxnpre7CqPw00goayMN1JFyeFpyoNj9qUiEW5pzjLPNeiTUfD2O+dUg70LkDhXmos
         mJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idi7jPK27aOQx+iUR6FrE1JXHV4RboCem2PMCjpX5oA=;
        b=PE9x3UekjpQb4ZqLJi56pdvikbReBOx1xzvyiE9folbty34o97YgHwYwzlcpl7pb76
         kCunKbmF1IOv1jerx9bFvPqfDHKpOzmOfl2WRezw3XpTfITGcdxXSAr/z0LdhqQbxq/v
         1mlTbzXsQKRe2e/sz/1sDzy+aRpMnEjNxcH+DxYsP1Y7Xsh5PkhjX8Gelaf5eFYYtRQH
         JOrfrmWG9rUR2HiW8PQBUnDIrx1iI5eOWiamulnoatIIyWv/DUDYvmYkrcrdz693iask
         G62OSltKk8mO9amfiygzDIGYIseMknv74BNez/IAsiGBLeJzwQC6Y8esAdGF3OPopQBm
         N/8g==
X-Gm-Message-State: ACrzQf3MoV4O3CMvhENnFszTVLt9K3L15zvxXr8PrpHPGjs7RBs3doc2
        yyMskMS0BFWID5UiVS7mPMve9rYDi2BVkIqJ7QQ=
X-Google-Smtp-Source: AMsMyM7t1W3y+KXEcU2nJbiaD/kz8jUbFtIm8fsSUMIScaKPgDFEi+NMkgm/sxzACd5SfTh3r3G9oTvu6rcyChSp5Ec=
X-Received: by 2002:adf:d23a:0:b0:236:467e:a3bc with SMTP id
 k26-20020adfd23a000000b00236467ea3bcmr4666865wrh.542.1666348992361; Fri, 21
 Oct 2022 03:43:12 -0700 (PDT)
MIME-Version: 1.0
From:   Emiley Margaret <wwwbizdataservice@gmail.com>
Date:   Fri, 21 Oct 2022 05:43:01 -0500
Message-ID: <CAL3_HK9F5GWrJ=-_ccXpvDSWL9sf=QXLk_AGxvKL74P31f21xA@mail.gmail.com>
Subject: Re: Money20/20 Attendees Data List 2022
To:     Emiley Margaret <wwwbizdataservice@gmail.com>
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

I hope you are right person to discuss about Money20/20 Attendees Databank?

List Includes:- Org-Name, First Name Last Name, Contact Job
Title,Verified Email Address, Website URL, Mailing Address, Phone
Number,Fax Number, Industry and many more=E2=80=A6

Number of Contacts  : 11,753 Opt-in Contacts
Cost                          : $1,576

Interested? Email me Back, I would love to provide more information on the =
list.

Kind Regards,
Emiley Margaret
Marketing Coordinator

To unsubscribe kindly reply with "Leave Out" in the subject line
