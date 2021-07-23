Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A813D369C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 10:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbhGWHn7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jul 2021 03:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhGWHn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jul 2021 03:43:58 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFE6C061575
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jul 2021 01:24:31 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o5-20020a1c4d050000b02901fc3a62af78so2998053wmh.3
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jul 2021 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=LIJZsjYxHwsexyp2FkJ66Nm+nxU2Vr6/jBrPAUgi9wA=;
        b=JJD6jhR5i9k3LUYeNE8OHQOtQboqnKrSVE91kl08GXh3kWoCwu3yqDpHOCiGVpuc4v
         6tyWWsb0KyQKlNyWMjF+zd3Os3j2M8MAt7WLLjNJ6QKxZNQQjcRCsSJo8PGchKx7hsb6
         r8U+IE+bVRa15PXUesiHwDIQyYJPGHlLwocRiMA8m6Y2NtTqvIN44eI8P+wFFdYUuB5h
         IHw7reke2/YHa0GdcoybU43OYweAhE/HIqQ2Djpm+afSBZkDUDq+hKqtdlf96QEA6BXp
         LRdDh0fasw1E2s/a3AYohxa+zhdJC+A41OMlnVjpYTukGYu5N9VhvXA9ZOij9Mol3Ino
         WDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=LIJZsjYxHwsexyp2FkJ66Nm+nxU2Vr6/jBrPAUgi9wA=;
        b=OCpQ63iDRwjoZHzWLfOove4uj9ab6kjNDdIm7sZk0ZX5Wb+Pb3t84S5MnGy/880wGn
         QCIqaecPnIL1DNg0h0SYktNiWZaGzyuymo0RkdTRURt9PN8apzXq9cyyeVmIO23EmfSr
         RojK7RdjwQPCkBBeajE5EW78vSn8yNeJkbKmhV/EjyLmSn7gKDmwoC7jHzet0p25nOkz
         5UjjzPIQKNcdDfsrHmeBtl++ZUXqnCG1vgWECTxjbyw9gNA3JLY/19StPD6j6yC7l9PS
         sG75yfVHXB59ZhhyD2xOtgF9FX5rDYy98ewJkk6srvqfHIE0tktWWD5VWhB6efapwNf/
         1zMA==
X-Gm-Message-State: AOAM531KRiuqBpUjzRnd3i+Ory5zJ7QpbL3DkKHrnu6vorAGPC2yxAe5
        E21sHBe3ZJPekuNVtZ0pFTIJbnC5nRgADkl4
X-Google-Smtp-Source: ABdhPJz6CIb1s7oonPKQxGKdM+wTjH+AjUMOsvzcUF0RVfoFRSEewO91d5ETW7TPJjWvXdxDCFhR+Q==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr3340446wme.143.1627028669961;
        Fri, 23 Jul 2021 01:24:29 -0700 (PDT)
Received: from [192.168.1.10] ([94.10.31.26])
        by smtp.googlemail.com with ESMTPSA id d5sm126888wre.77.2021.07.23.01.24.29
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 01:24:29 -0700 (PDT)
To:     linux-i2c@vger.kernel.org
From:   Chris Clayton <chris2553@googlemail.com>
Subject: i2c-tools-4.3 - tarballs from kernel.org
Message-ID: <c6403e32-2e48-c556-d08e-2c4441e34565@googlemail.com>
Date:   Fri, 23 Jul 2021 09:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

The tarballs at https://www.kernel.org/pub/software/utils/i2c-tools/ seem to contain source for v4.0.
The file version.h contains "#define VERSION "4.0"

Chris
