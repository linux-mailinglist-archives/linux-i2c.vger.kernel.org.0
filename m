Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4BB4851FD
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 12:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236137AbiAELp1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 06:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239775AbiAELp1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jan 2022 06:45:27 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FCFC061761
        for <linux-i2c@vger.kernel.org>; Wed,  5 Jan 2022 03:45:26 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so50919144otj.7
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jan 2022 03:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=E0D180xf84KjktzARqa69RIEL5prOoeDC6G7I5zjJ0g=;
        b=LNB3nH9+dVWLsxg4oBLp8C+IwnTl4fwLNBovqiR6VQzbAJZnPt3EcJ37AJ1A6qrWIM
         OYsNv4MieVcob32mBF3zXKts6qqAPqZpcVT/FUY19jF0lyGzYGOz7jkUAQWDUzyIEskd
         8uOu0ma1y+rInPNmJBrephpp1y83Nw8QK+vS4jth9Rzk1Q+RxFZF6dfnFraESIEOZ+Dv
         f44CW7UTYb4qDZorEV/JTyvNAYXIdsTN1URk2GSOmnAGIB90Iu+sYvvg4k148iLVTR7q
         Z9A8k9bBZNY/YtpBZztAn1C97E+2VjSTQBfPP7Io/4MxqwCcHmy/7KnrOzzEeXgcLIjK
         44Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=E0D180xf84KjktzARqa69RIEL5prOoeDC6G7I5zjJ0g=;
        b=ag7xcneIKD/OcKCZ4ejY9Oe+gFyPB7wbQ/DV8+VxWThwFPVZvo8vuZURgVWOakUeAr
         2JuuorHyjZTWjpQLFnkEp9/TIrx/tMcXfa+Q6wAzDJSWZNfWaxs2FItpyFtZzeKE92Bm
         q0vf8Cj86X5FC6lCAXXgYsZhF1ZIuOzJOzfFRFM5eJ1T1YEB8Ub/2T2cir6KvOu3maZ+
         qSrbaz+59BmFCJvDONs+GgEzxM+BziJG+tpxTKZIYa2gGdVuDx4pVa0H8W94FdyTB3QD
         tK7Y3HR3HFBKntpR/exHBaGyCZo67Xm9t8/b397mDI64coq9ePv61DGBYufT/23KeHTo
         ZbxA==
X-Gm-Message-State: AOAM530twQtDciJtdd0+cVSda9CeR9Ws4pizNtKvqa8TsNjOZx21+yx4
        dZNRD4fcBEJgZzKL2DwbCF97tSeSufvZUBEGhII7u/fXpDw=
X-Google-Smtp-Source: ABdhPJzBKWhshtvhAqcrXwnz1RNdrm5muClaHN8Dt0u3tjJDXfA97UCQEFtMuC7+uGZKpS0S6FIwC6zCuixrFsCnOtc=
X-Received: by 2002:a9d:2783:: with SMTP id c3mr39451960otb.284.1641383126025;
 Wed, 05 Jan 2022 03:45:26 -0800 (PST)
MIME-Version: 1.0
References: <CAKfDRXgUvN19PUd_ebRJs-k_ytrGwgA=e6d3QJ9cwJogUGpoyw@mail.gmail.com>
In-Reply-To: <CAKfDRXgUvN19PUd_ebRJs-k_ytrGwgA=e6d3QJ9cwJogUGpoyw@mail.gmail.com>
From:   Kristian Evensen <kristian.evensen@gmail.com>
Date:   Wed, 5 Jan 2022 12:45:15 +0100
Message-ID: <CAKfDRXjWrS6x7ZTgvuYB=qLABfuDhjS7DrrevytY1a0BhKMfAQ@mail.gmail.com>
Subject: Re: mt7621 i2c fails with upstream driver
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi again,

On Wed, Jan 5, 2022 at 10:51 AM Kristian Evensen
<kristian.evensen@gmail.com> wrote:
> Replacing the new with the old driver makes i2c work again, but I
> would like to try to avoid that. My knowledge of i2c is very limited,
> so I wondered if anyone knows what could be wrong or have any
> suggestions on things I can try to for example change in the driver?

I spent some more time instrumenting the driver. The call that always
times out is the call to mtk_i2c_master_start() made from
mtk_i2c_master_xfer(). From what I can tell, this is the first time
data is written and when I compared with the previous driver, I do not
find equivalents of master_{start,stop,cmd} writes, I only see direct
calls to iowrite/ioread.

Kristian
