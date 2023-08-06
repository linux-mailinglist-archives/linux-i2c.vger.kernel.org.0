Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F51771585
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Aug 2023 16:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjHFOKi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Aug 2023 10:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjHFOKh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Aug 2023 10:10:37 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BA111D
        for <linux-i2c@vger.kernel.org>; Sun,  6 Aug 2023 07:10:34 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b962535808so55267591fa.0
        for <linux-i2c@vger.kernel.org>; Sun, 06 Aug 2023 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691331032; x=1691935832;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=EwSka9bRyZ79D15dq5B+5nLzDe2WbomQnbVHJeRZC1LzLUkYdBJsUMncT3WfK/B1+W
         jtIVi31p2yflqy03GpRThOUFpkrh9yPFVMololkiJPbiT3PvafL+TnL1wC+602kAMhiR
         wt3ZcZImtAsXI3hJmoh99iMz9SbLD4o6dhtscrT02WU1NWgv/6ctiQHWztYZU9XuZzg5
         xpQvXmyyWLnEc7kAYhVb932fyvIa/9orkLxjC3XalQzaMLk+sPwIU8/A2BLkY32ZDdW0
         v4TmHUWaRABnEql+g8Bn96zpFkQCdsT95jF4qy+qosK9iscL3P13uPuOIJOki7M89R1G
         Bsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691331032; x=1691935832;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=dF4djGhZQ9UQZict12kOcP5k0RW+uzPwUZZ66n93K9h3RM1r4FewEjOPLLKDHPD+E0
         dWOT0Dq9PLtecrlwrxE5JfL7PyiTk5Kp5PTJO0uDpVWYF2f2zeXBttbZT9bBeOyj10xd
         2szhSoaq9t7rDrj42WzsSIgFSPKkcbpW2pFgOpo+12YhPqvB/xjusENyAjDOoumqkVjH
         yCC/MFyXAE+Uy4n2CNGa1wi5CixEYgbxxefOXPKVNDEGdsIX3GX0TCSEmMQUh98/Xrzn
         EDg1uk2eMypxUlSFjkm9ZKW/IlSe6q2ij4iWtbyCOOTZcaGKP/CQwgJGd22HGf4OEeVq
         LxKA==
X-Gm-Message-State: AOJu0YwsJj6m1PdntnHXm+SC6x/gSRbKhjo3416b1SjjNNVTv51hcQwh
        PHBgnU85OOO1cbvQteHVY0MuNPUx4Pn3DSBAww==
X-Google-Smtp-Source: AGHT+IG8ng7e5htxY1czJ/JNEJh9rNbSxovFWZLoh/aADL43+mrpACzzItnq2Z0vPdiRZMmEdEIWJVyrLMeeXHHSPsE=
X-Received: by 2002:a05:6512:3713:b0:4f8:6ac4:84 with SMTP id
 z19-20020a056512371300b004f86ac40084mr3936002lfr.8.1691331031942; Sun, 06 Aug
 2023 07:10:31 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsanna62@gmail.com
Received: by 2002:ab3:7ad7:0:b0:239:3130:ecb6 with HTTP; Sun, 6 Aug 2023
 07:10:31 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Sun, 6 Aug 2023 07:10:31 -0700
X-Google-Sender-Auth: fStl3cE0rajaldupjsYMfe4zEmI
Message-ID: <CABLa-dr=A7i3symM7UJO9TT+48jLbvTF07GGeRjFAuc__fSj=Q@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
